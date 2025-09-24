-- +goose up
CREATE TABLE "tasks" (
  "id" TEXT NOT NULL UNIQUE, -- Pattern: tk-#
	"description" TEXT NOT NULL,
  "state" TEXT NOT NULL, -- Valid options: not_started, started, done
  "due_date" TEXT, -- datetime sqlite function
  "tags" TEXT NOT NULL, -- json list
	"user_id" TEXT NOT NULL,
  "subject_id" TEXT NOT NULL,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  "active" INTEGER NOT NULL,
	PRIMARY KEY("id"),
  CONSTRAINT fk_task_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_task_subject
    FOREIGN KEY (subject_id)
    REFERENCES subjects(id)
    ON DELETE CASCADE
);
-- +goose down
DELETE FROM tasks;
DROP TABLE tasks;
