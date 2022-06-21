-- AlterTable
ALTER TABLE "admin" ADD COLUMN     "role" TEXT NOT NULL DEFAULT E'admin';

-- AlterTable
ALTER TABLE "prof" ADD COLUMN     "role" TEXT NOT NULL DEFAULT E'prof';

-- AlterTable
ALTER TABLE "student" ADD COLUMN     "role" TEXT NOT NULL DEFAULT E'student';
