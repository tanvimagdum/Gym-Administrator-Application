
use gym_schema;
create user dbadmin identified by "12345";

grant all on gym_schema.* to "dbadmin";

flush privileges;


use mysql;
SELECT user from user;
