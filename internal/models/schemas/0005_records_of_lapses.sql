-- +goose up
CREATE TABLE "records_of_lapses" (
  "id" TEXT NOT NULL UNIQUE, -- Pattern: rc-#
  "start_time" TEXT NOT NULL, -- datetime sqlite function
  "finish_time" TEXT NOT NULL, -- datetime sqlite function
	"duration" INTEGER NOT NULL, -- Saved in seconds
	"user_id" TEXT NOT NULL,
	"subject_id" TEXT NOT NULL,
	"task_id" TEXT NOT NULL,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  "active" INTEGER NOT NULL,
	PRIMARY KEY("id"),
  CONSTRAINT fk_rd_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_rd_subject
    FOREIGN KEY (subject_id)
    REFERENCES subjects(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_rd_task
    FOREIGN KEY (task_id)
    REFERENCES tasks(id)
    ON DELETE CASCADE
);
-- +goose down
DELETE FROM records_of_lapses;
DROP TABLE records_of_lapses;
