-- CreateTable
CREATE TABLE "student_info" (
    "id" SERIAL NOT NULL,
    "student_id" INTEGER NOT NULL,
    "date_birth" TEXT,
    "address" TEXT,
    "email" TEXT,
    "contacts" JSONB[],
    "notes" JSONB[],

    CONSTRAINT "student_info_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "student_info" ADD CONSTRAINT "student_info_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE CASCADE;
