-- CreateTable
CREATE TABLE "Tweets" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "scheduledDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Tweets_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Tweets" ADD CONSTRAINT "Tweets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
