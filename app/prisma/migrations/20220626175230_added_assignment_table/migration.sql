/*
  Warnings:

  - Added the required column `isPaid` to the `private_session_payment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `paid_amount` to the `private_session_payment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `paid_amount` to the `student_payment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "course" ADD COLUMN     "description" TEXT;

-- AlterTable
ALTER TABLE "private_session_payment" ADD COLUMN     "isPaid" BOOLEAN NOT NULL,
ADD COLUMN     "paid_amount" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "student_payment" ADD COLUMN     "paid_amount" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "assignment" (
    "id" SERIAL NOT NULL,
    "student_id" INTEGER NOT NULL,
    "prof_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,
    "due_date" TIMESTAMP(3) NOT NULL,
    "comments" JSONB,

    CONSTRAINT "assignment_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "assignment" ADD CONSTRAINT "assignment_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment" ADD CONSTRAINT "assignment_prof_id_fkey" FOREIGN KEY ("prof_id") REFERENCES "prof"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment" ADD CONSTRAINT "assignment_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE CASCADE;
