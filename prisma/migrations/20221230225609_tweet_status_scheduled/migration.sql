/*
  Warnings:

  - The values [sent] on the enum `TweetStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "TweetStatus_new" AS ENUM ('pending', 'scheduled');
ALTER TABLE "Tweets" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "Tweets" ALTER COLUMN "status" TYPE "TweetStatus_new" USING ("status"::text::"TweetStatus_new");
ALTER TYPE "TweetStatus" RENAME TO "TweetStatus_old";
ALTER TYPE "TweetStatus_new" RENAME TO "TweetStatus";
DROP TYPE "TweetStatus_old";
ALTER TABLE "Tweets" ALTER COLUMN "status" SET DEFAULT 'pending';
COMMIT;
