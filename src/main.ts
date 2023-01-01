import cron from "node-cron";

const ONE_MINUTE = `*/1 * * * *`;

cron.schedule(ONE_MINUTE, async () => {
  console.log("running your task...");
});
