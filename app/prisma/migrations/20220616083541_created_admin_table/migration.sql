-- CreateTable
CREATE TABLE "admin" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "password" TEXT NOT NULL DEFAULT E'please add me',
    "date_created" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);
