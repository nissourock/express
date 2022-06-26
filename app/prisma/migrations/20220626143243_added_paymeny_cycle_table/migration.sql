-- CreateTable
CREATE TABLE "payment_cycle" (
    "id" SERIAL NOT NULL,
    "cycle_start" TIMESTAMP(3) NOT NULL,
    "cycle_end" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "payment_cycle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_payment_cycleTostudent" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_payment_cycleTostudent_AB_unique" ON "_payment_cycleTostudent"("A", "B");

-- CreateIndex
CREATE INDEX "_payment_cycleTostudent_B_index" ON "_payment_cycleTostudent"("B");

-- AddForeignKey
ALTER TABLE "_payment_cycleTostudent" ADD CONSTRAINT "_payment_cycleTostudent_A_fkey" FOREIGN KEY ("A") REFERENCES "payment_cycle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_payment_cycleTostudent" ADD CONSTRAINT "_payment_cycleTostudent_B_fkey" FOREIGN KEY ("B") REFERENCES "student"("id") ON DELETE CASCADE ON UPDATE CASCADE;
