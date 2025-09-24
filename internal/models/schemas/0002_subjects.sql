-- +goose up
CREATE TABLE "subjects"(
  "id" TEXT NOT NULL UNIQUE, -- Pattern: sb-#
	"name" TEXT NOT NULL,
	"user_id" TEXT NOT NULL,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  "active" INTEGER NOT NULL,
	PRIMARY KEY("id"),
  CONSTRAINT fk_subject_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);
-- +goose down
DELETE FROM subjects;
DROP TABLE subjects;
