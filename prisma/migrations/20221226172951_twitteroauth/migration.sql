/*
  Warnings:

  - You are about to drop the column `twitterRefreshToken` on the `Users` table. All the data in the column will be lost.
  - Added the required column `twitterAccessSecret` to the `Users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `twitterOauthVerifier` to the `Users` table without a default value. This is not possible if the table is not empty.
  - Made the column `twitterAccessToken` on table `Users` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Users" DROP COLUMN "twitterRefreshToken",
ADD COLUMN     "twitterAccessSecret" TEXT NOT NULL,
ADD COLUMN     "twitterOauthVerifier" TEXT NOT NULL,
ALTER COLUMN "twitterAccessToken" SET NOT NULL;
