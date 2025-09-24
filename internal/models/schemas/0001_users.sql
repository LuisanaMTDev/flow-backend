-- +goose up
CREATE TABLE "users" (
  "id" TEXT NOT NULL UNIQUE, -- Pattern: us-""
  "hashed_password" TEXT NOT NULL UNIQUE,
  "csrf_token" TEXT NOT NULL UNIQUE,
  "session_token" TEXT NOT NULL UNIQUE,
  "email" TEXT UNIQUE,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  "active" INTEGER NOT NULL,
	PRIMARY KEY("id")
);
-- +goose down
DELETE FROM users;
DROP TABLE users;
