------------- SQLite3 Dump File -------------

-- ------------------------------------------
-- Dump of "Tasks"
-- ------------------------------------------

DROP TABLE IF EXISTS "Tasks";

CREATE TABLE "Tasks"(
	"id" Integer PRIMARY KEY AUTOINCREMENT,
	"name" Text,
	"cmd" Text,
	"result" Text,
	"description" Text );


BEGIN;

INSERT INTO "Tasks" ("id","name","cmd","result","description") VALUES 
( 1, 'Chequear usuario root', 'cat /etc/passwd | grep :0: | wc -l', '1', 'Cantidad de usuarios con UID 0' );



COMMIT;

-- ------------------------------------------
-- Dump of "TasksDetail"
-- ------------------------------------------

DROP TABLE IF EXISTS "TasksDetail";

CREATE TABLE "TasksDetail"(
	"name" Text,
	"description" Text,
	"cmd" Text,
	"result" Text,
	"id" Integer PRIMARY KEY AUTOINCREMENT,
	"parentId" Integer );


