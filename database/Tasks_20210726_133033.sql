CREATE TABLE "Tasks"(
	"id" Integer PRIMARY KEY AUTOINCREMENT,
	"name" Text,
	"cmd" Text,
	"result" Text,
	"description" Text );


BEGIN;

INSERT INTO "Tasks" ("id","name","cmd","result","description") VALUES 
( 1, 'Check root user', 'cat /etc/passwd | grep :0: | wc -l', '0', 'Find number of users with id 0' );



COMMIT;

