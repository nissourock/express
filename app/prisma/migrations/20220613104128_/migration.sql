-- CreateTable
CREATE TABLE "attendance_student" (
    "id" SERIAL NOT NULL,
    "session_id" INTEGER NOT NULL,
    "student_id" INTEGER NOT NULL,
    "is_present" BOOLEAN NOT NULL,

    CONSTRAINT "attendance_student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course" (
    "id" SERIAL NOT NULL,
    "course_name" TEXT,
    "course_level_id" INTEGER NOT NULL,

    CONSTRAINT "course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course_material" (
    "id" SERIAL NOT NULL,
    "material_title" TEXT,
    "material_description" TEXT,
    "course_id" INTEGER,
    "prof_id" INTEGER,

    CONSTRAINT "course_material_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "level" (
    "id" SERIAL NOT NULL,
    "level_name" VARCHAR(3) NOT NULL,

    CONSTRAINT "level_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "private_session" (
    "id" SERIAL NOT NULL,
    "course_id" INTEGER NOT NULL,
    "prof_id" INTEGER NOT NULL,
    "level_id" INTEGER NOT NULL,
    "date_occurence" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "student_id" INTEGER NOT NULL,

    CONSTRAINT "private_session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "prof" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT,
    "last_name" TEXT,
    "level_teached" INTEGER NOT NULL,
    "course_teached" INTEGER NOT NULL,

    CONSTRAINT "prof_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "room" (
    "id" SERIAL NOT NULL,
    "room_name" TEXT,
    "room_capacity" TEXT,

    CONSTRAINT "room_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "session" (
    "id" SERIAL NOT NULL,
    "session_level" INTEGER NOT NULL,
    "session_course" INTEGER NOT NULL,
    "session_start" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "course_prof_name" INTEGER,
    "room_id" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "date_joined" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "level_id" INTEGER NOT NULL DEFAULT 3,
    "ishot" TEXT,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "fki_student_level" ON "student"("id");

-- AddForeignKey
ALTER TABLE "attendance_student" ADD CONSTRAINT "attendance_student_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "session"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance_student" ADD CONSTRAINT "attendance_student_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_course_level_id_fkey" FOREIGN KEY ("course_level_id") REFERENCES "level"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course_material" ADD CONSTRAINT "course_material_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course_material" ADD CONSTRAINT "course_material_prof_id_fkey" FOREIGN KEY ("prof_id") REFERENCES "prof"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "level"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_prof_id_fkey" FOREIGN KEY ("prof_id") REFERENCES "prof"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prof" ADD CONSTRAINT "prof_course_teached_fkey" FOREIGN KEY ("course_teached") REFERENCES "course"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prof" ADD CONSTRAINT "prof_level_teached_fkey" FOREIGN KEY ("level_teached") REFERENCES "level"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_session_course_fkey" FOREIGN KEY ("session_course") REFERENCES "course"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_session_level_fkey" FOREIGN KEY ("session_level") REFERENCES "level"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_course_prof_name_fkey" FOREIGN KEY ("course_prof_name") REFERENCES "prof"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "room"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "level"("id") ON DELETE CASCADE ON UPDATE CASCADE;
