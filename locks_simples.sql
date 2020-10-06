"select
    blocking_session,
    sid,    serial#,
    sql_id,
    wait_class,
    seconds_in_wait,
    username,
    PROGRAM,
    MACHINE
from
    gv$session
where
    blocking_session is not NULL
order by
    blocking_session