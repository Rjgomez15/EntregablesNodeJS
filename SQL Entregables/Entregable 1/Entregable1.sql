--table users {
--  id uuid [pk]
--  name varchar(30) [not null]
--  email varchar(100) [unique]
--  password varchar(50) [not null]
--  role_id int [pk]
--  age int
}

--table courses {
--  id uuiid [pk]
--  title varchar(100) [not null]
--  description varchar(400) [not null]
--  level int [default: 1]
--  category_id int [pk]
--  video_id int [pk]
--  teacher_id uuid [not null, pk]
--}

--table course_video {
--  id int [pk]
--  title varchar(300) [not null]
--  url varchar(300) [not null]
--}

--table categories {
--  id int [pk]
--  name varchar(50) [not null]
--}

--table roles {
--  id int [pk]
--  name varchar(50) [not null]
--}


--Ref: "users"."role_id" < "roles"."id"

--Ref: "users"."id" < "courses"."teacher_id"

--Ref: "categories"."id" < "courses"."category_id"

--Ref: "course_video"."id" < "courses"."video_id"

CREATE TABLE "users" (
  "id" uuid,
  "name" varchar(30) NOT NULL,
  "email" varchar(100) UNIQUE,
  "password" varchar(50) NOT NULL,
  "role_id" int,
  "age" int,
  PRIMARY KEY ("id", "role_id")
);

CREATE TABLE "courses" (
  "id" uuid,
  "title" varchar(100) NOT NULL,
  "description" varchar(400) NOT NULL,
  "level" int DEFAULT 1,
  "category_id" int,
  "video_id" int,
  "teacher_id" uuid NOT NULL,
  PRIMARY KEY ("id", "category_id", "video_id", "teacher_id")
);

CREATE TABLE "course_video" (
  "id" int PRIMARY KEY,
  "title" varchar(300) NOT NULL,
  "url" varchar(300) NOT NULL
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

ALTER TABLE "roles" ADD FOREIGN KEY ("id") REFERENCES "users" ("role_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("video_id") REFERENCES "course_video" ("id");


insert into users values (
	'6e4febc7-9516-4361-bbb0-8c4fd76bfa16',
	'Raul Gomez',
	'raulg@gmail.com',
	'1234567',
	'1',
	'25'
), (
	'ea2e5154-6f84-432c-8308-8d49c4fd3b15',
	'Maria Diaz',
	'mariadiaz@gmail.com',
	'1234567',
	'1',
	'24'
);


insert into courses values (
	'8884e5ae-71a4-4222-b7ec-41435ededb6e',
	'Introduccion a SQL',
	'bases teoricas, listas, conocimientos y practicas basicas',
	'1',
	'1',
	'4d9eaa3f-6caf-4803-aeed-d55cdb15d254'
), (
	'1a39a7c9-a48b-43d6-ad7e-46c74e7d2036',
	'Introduccion a WordPress',
	'introduccion dentro de la plataforma, plugins, funcionamientos basicos y demas',
	'1',
	'1',
	'95d829e7-6938-46d9-bca0-0b8b68796cd9'
);

insert into users values (
	'75f00590-466a-4608-8f57-a50338a2118d',
	'Raul Gomez',
	'raulg@gmail.com',
	'1234567',
	'1',
	'25'
), (
	'0a866a92-9cf2-4847-875b-408208294d81',
	'Maria Diaz',
	'mariadiaz@gmail.com',
	'1234567',
	'1',
	'24'
);

insert into categories  values (
	'b3f94ffe-0787-441a-bfb6-420202caa982',
	'Informatica'
), (
	'c7f4704a-145c-4866-8394-94bd3bd01a50',
	'Informatica'
);

insert into roles  values (
	'06035c88-4429-4368-a866-f3ec5858a5ea',
	'profesor'
), (
	'4a2e2e9b-f75b-4963-9a3e-7a65ebcb9515',
	'alumno'
);