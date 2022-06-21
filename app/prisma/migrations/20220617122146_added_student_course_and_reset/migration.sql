-- CreateTable
CREATE TABLE "student_course" (
    "id" SERIAL NOT NULL,
    "date_enrollment" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "course_id" INTEGER,
    "student_id" INTEGER,

    CONSTRAINT "student_course_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "student_course" ADD CONSTRAINT "student_course_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_course" ADD CONSTRAINT "student_course_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE CASCADE ON UPDATE CASCADE;
