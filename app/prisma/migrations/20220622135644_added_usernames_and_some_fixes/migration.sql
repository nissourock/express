/*
  Warnings:

  - Made the column `last_name` on table `admin` required. This step will fail if there are existing NULL values in that column.
  - Made the column `date_created` on table `admin` required. This step will fail if there are existing NULL values in that column.
  - Made the column `course_name` on table `course` required. This step will fail if there are existing NULL values in that column.
  - Made the column `material_title` on table `course_material` required. This step will fail if there are existing NULL values in that column.
  - Made the column `material_description` on table `course_material` required. This step will fail if there are existing NULL values in that column.
  - Made the column `course_id` on table `course_material` required. This step will fail if there are existing NULL values in that column.
  - Made the column `prof_id` on table `course_material` required. This step will fail if there are existing NULL values in that column.
  - Made the column `date_occurence` on table `private_session` required. This step will fail if there are existing NULL values in that column.
  - Made the column `first_name` on table `prof` required. This step will fail if there are existing NULL values in that column.
  - Made the column `last_name` on table `prof` required. This step will fail if there are existing NULL values in that column.
  - Made the column `session_start` on table `session` required. This step will fail if there are existing NULL values in that column.
  - Made the column `last_name` on table `student` required. This step will fail if there are existing NULL values in that column.
  - Made the column `date_joined` on table `student` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "attendance_student" DROP CONSTRAINT "attendance_student_session_id_fkey";

-- DropForeignKey
ALTER TABLE "attendance_student" DROP CONSTRAINT "attendance_student_student_id_fkey";

-- DropForeignKey
ALTER TABLE "course" DROP CONSTRAINT "course_course_level_id_fkey";

-- DropForeignKey
ALTER TABLE "private_session" DROP CONSTRAINT "private_session_course_id_fkey";

-- DropForeignKey
ALTER TABLE "private_session" DROP CONSTRAINT "private_session_level_id_fkey";

-- DropForeignKey
ALTER TABLE "private_session" DROP CONSTRAINT "private_session_prof_id_fkey";

-- DropForeignKey
ALTER TABLE "private_session" DROP CONSTRAINT "private_session_student_id_fkey";

-- DropForeignKey
ALTER TABLE "prof" DROP CONSTRAINT "prof_course_teached_fkey";

-- DropForeignKey
ALTER TABLE "prof" DROP CONSTRAINT "prof_level_teached_fkey";

-- DropForeignKey
ALTER TABLE "session" DROP CONSTRAINT "session_course_prof_name_fkey";

-- DropForeignKey
ALTER TABLE "session" DROP CONSTRAINT "session_room_id_fkey";

-- DropForeignKey
ALTER TABLE "session" DROP CONSTRAINT "session_session_course_fkey";

-- DropForeignKey
ALTER TABLE "session" DROP CONSTRAINT "session_session_level_fkey";

-- AlterTable
ALTER TABLE "admin" ADD COLUMN     "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "username" TEXT NOT NULL DEFAULT E'please add me',
ALTER COLUMN "last_name" SET NOT NULL,
ALTER COLUMN "date_created" SET NOT NULL;

-- AlterTable
ALTER TABLE "course" ALTER COLUMN "course_name" SET NOT NULL;

-- AlterTable
ALTER TABLE "course_material" ALTER COLUMN "material_title" SET NOT NULL,
ALTER COLUMN "material_description" SET NOT NULL,
ALTER COLUMN "course_id" SET NOT NULL,
ALTER COLUMN "prof_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "private_session" ALTER COLUMN "date_occurence" SET NOT NULL;

-- AlterTable
ALTER TABLE "prof" ADD COLUMN     "date_joined" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "password" TEXT NOT NULL DEFAULT E'please add me',
ADD COLUMN     "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "username" TEXT NOT NULL DEFAULT E'please add me',
ALTER COLUMN "first_name" SET NOT NULL,
ALTER COLUMN "last_name" SET NOT NULL;

-- AlterTable
ALTER TABLE "session" ALTER COLUMN "session_start" SET NOT NULL;

-- AlterTable
ALTER TABLE "student" ADD COLUMN     "username" TEXT NOT NULL DEFAULT E'please add me',
ALTER COLUMN "last_name" SET NOT NULL,
ALTER COLUMN "date_joined" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "attendance_student" ADD CONSTRAINT "attendance_student_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "session"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendance_student" ADD CONSTRAINT "attendance_student_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_course_level_id_fkey" FOREIGN KEY ("course_level_id") REFERENCES "level"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "level"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_prof_id_fkey" FOREIGN KEY ("prof_id") REFERENCES "prof"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session" ADD CONSTRAINT "private_session_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prof" ADD CONSTRAINT "prof_course_teached_fkey" FOREIGN KEY ("course_teached") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prof" ADD CONSTRAINT "prof_level_teached_fkey" FOREIGN KEY ("level_teached") REFERENCES "level"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_session_course_fkey" FOREIGN KEY ("session_course") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_session_level_fkey" FOREIGN KEY ("session_level") REFERENCES "level"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_course_prof_name_fkey" FOREIGN KEY ("course_prof_name") REFERENCES "prof"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "room"("id") ON DELETE NO ACTION ON UPDATE CASCADE;
