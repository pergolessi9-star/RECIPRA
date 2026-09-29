import pg from "pg";
const {Pool}=pg;
export const pool=new Pool({connectionString:process.env.DATABASE_URL});
export async function withTenant<T>(tenantId:string,fn:(client:pg.PoolClient)=>Promise<T>):Promise<T>{const c=await pool.connect();try{await c.query("BEGIN");await c.query("SELECT set_config('app.tenant_id',$1,true)",[tenantId]);const result=await fn(c);await c.query("COMMIT");return result;}catch(e){await c.query("ROLLBACK");throw e;}finally{c.release();}}
