-- CreateEnum
CREATE TYPE "TweetStatus" AS ENUM ('pending', 'sent');

-- AlterTable
ALTER TABLE "Tweets" ADD COLUMN     "status" "TweetStatus" NOT NULL DEFAULT 'pending';
