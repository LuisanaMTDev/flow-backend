CREATE TABLE "subjects"(
	"id" INTEGER NOT NULL UNIQUE,
	"name" TEXT NOT NULL,
	"owner" TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "tasks" (
	"id" INTEGER NOT NULL UNIQUE,
	"description" TEXT NOT NULL,
	"state" INTEGER NOT NULL,
	"owner" TEXT NOT NULL,
	"subject" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("subject") REFERENCES "subjects"("id") ON DELETE CASCADE
);
CREATE TABLE "subject recorded time" (
	"id" INTEGER NOT NULL UNIQUE,
	"duration" NUMERIC NOT NULL,
	"datetime" NUMERIC NOT NULL,
	"owner" TEXT NOT NULL,
	"subject" INTEGER NOT NULL,
	"task" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("subject") REFERENCES "subjects"("id") ON DELETE CASCADE,
	FOREIGN KEY("task") REFERENCES "tasks"("id") ON DELETE CASCADE
);
