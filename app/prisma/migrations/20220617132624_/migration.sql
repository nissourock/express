-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_level_id_fkey";

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "level"("id") ON DELETE NO ACTION ON UPDATE CASCADE;
