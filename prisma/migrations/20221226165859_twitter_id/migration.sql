/*
  Warnings:

  - You are about to drop the column `email` on the `Users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[twitterId]` on the table `Users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `twitterId` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Users_email_key";

-- AlterTable
ALTER TABLE "Users" DROP COLUMN "email",
ADD COLUMN     "twitterId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Users_twitterId_key" ON "Users"("twitterId");
