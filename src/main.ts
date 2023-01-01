import cron from "node-cron";
import TwitterApi from "twitter-api-v2";
import { PrismaClient } from "@prisma/client";

const prismaClient = new PrismaClient();
const ONE_MINUTE = `*/1 * * * *`;

cron.schedule(ONE_MINUTE, async () => {
  try {
    console.log(`${new Date().toISOString()} - Scheduling`);
    const users = await prismaClient.users.findMany({
      include: {
        tweets: {
          where: {
            status: "pending",
            scheduledDate: {
              lte: new Date(),
            },
          },
        },
      },
    });

    for (const user of users) {
      const twitterClient = new TwitterApi(user.twitterAccessToken);
      await Promise.all(
        user.tweets.map(({ text }: { text: string }) =>
          twitterClient.v2.tweet(text)
        )
      );
      await prismaClient.tweets.updateMany({
        where: {
          id: {
            in: user.tweets.map(({ id }: { id: number }) => id),
          },
        },
        data: {
          status: "scheduled",
        },
      });
    }
  } catch (ex) {
    console.log(ex);
  }
});
