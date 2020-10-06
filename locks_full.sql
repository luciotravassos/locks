select distinct a.INST_ID,a.username,a.sid, a.serial#, a.lockwait, a.status, a.osuser,a.machine,to_char(a.logon_time,'dd/mm-hh24:mi:ss') dt_hora,
a.program, a.machine, a.last_call_et/60 as Min,a.event,a.sql_id,dbms_lob.substr(b.SQL_FULLTEXT, 4000, 2) "SQL_FULLTEXT",
'alter system kill session ''' ||a.sid||','||a.serial#||',@'||a.inst_id||''' immediate ;' as KILL
from gv$session a,gv$sqlarea b
 where a.sql_id=b.sql_id
and  a.LockWait is not null