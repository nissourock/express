/*
  Warnings:

  - You are about to drop the `_payment_cycleTostudent` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_payment_cycleTostudent" DROP CONSTRAINT "_payment_cycleTostudent_A_fkey";

-- DropForeignKey
ALTER TABLE "_payment_cycleTostudent" DROP CONSTRAINT "_payment_cycleTostudent_B_fkey";

-- DropTable
DROP TABLE "_payment_cycleTostudent";

-- CreateTable
CREATE TABLE "student_payment" (
    "id" SERIAL NOT NULL,
    "cycle_id" INTEGER NOT NULL,
    "student_id" INTEGER NOT NULL,
    "isPaid" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "student_payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "private_session_payment" (
    "id" SERIAL NOT NULL,
    "private_session_id" INTEGER NOT NULL,

    CONSTRAINT "private_session_payment_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "student_payment" ADD CONSTRAINT "student_payment_cycle_id_fkey" FOREIGN KEY ("cycle_id") REFERENCES "payment_cycle"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_payment" ADD CONSTRAINT "student_payment_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_session_payment" ADD CONSTRAINT "private_session_payment_private_session_id_fkey" FOREIGN KEY ("private_session_id") REFERENCES "private_session"("id") ON DELETE NO ACTION ON UPDATE CASCADE;
