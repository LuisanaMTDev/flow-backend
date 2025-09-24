-- +goose up
CREATE TABLE "tags" (
  "id" TEXT NOT NULL UNIQUE, -- Pattern: tg-#
  "name" TEXT NOT NULL,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  "active" INTEGER NOT NULL,
	PRIMARY KEY("id")
);
-- +goose down
DELETE FROM tags;
DROP TABLE tags;
