CREATE TABLE "follows" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "role" varchar,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "body" text,
  "user_id" integer,
  "status" varchar,
  "created_at" timestamp
);

CREATE TABLE "Guests" (
  "guest_id" INT PRIMARY KEY,
  "name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(15),
  "address" VARCHAR(255),
  "date_of_birth" DATE,
  "room_id" INT,
  "reservation_id" INT
);

CREATE TABLE "Reservations" (
  "reservation_id" INT PRIMARY KEY,
  "check_in_date" DATE,
  "check_out_date" DATE,
  "guest_id" INT,
  "total_amount" DECIMAL(10,2),
  "payment_status" VARCHAR(20),
  "booking_date" DATE
);

CREATE TABLE "Rooms" (
  "room_id" INT PRIMARY KEY,
  "room_number" VARCHAR(10),
  "type" VARCHAR(50),
  "price_per_night" DECIMAL(10,2),
  "status" VARCHAR(20),
  "floor" INT,
  "bed_count" INT,
  "reservation_id" INT
);

COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");

ALTER TABLE "Reservations" ADD FOREIGN KEY ("guest_id") REFERENCES "Guests" ("guest_id");

ALTER TABLE "Rooms" ADD FOREIGN KEY ("reservation_id") REFERENCES "Reservations" ("reservation_id");

ALTER TABLE "Guests" ADD CONSTRAINT "FK_Rooms" FOREIGN KEY ("room_id") REFERENCES "Rooms" ("room_id");

ALTER TABLE "Guests" ADD CONSTRAINT "FK_Reservations" FOREIGN KEY ("reservation_id") REFERENCES "Reservations" ("reservation_id");
