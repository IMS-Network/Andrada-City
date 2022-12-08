# Discord FiveM Chat Webhook Sync

This script syncs with a Discord webhook and relays all messages from the FiveM server chat to a Discord channel.

## Requirements

- FiveM server
- Discord webhook

## Installation

1. Create a Discord webhook for the channel that you want to sync the messages to.
2. Copy the webhook URL and the channel ID.
3. Download the script and place it in the `server/` directory of your FiveM server.
4. Edit the `server/main.lua` file and set the `WEBHOOK_URL` and `CHANNEL_ID` variables to the values from step 2.
5. Add the `json` module as a dependency in the `fxmanifest.lua` file.
6. Start the FiveM server and the script will automatically sync messages to the Discord channel.

## Configuration

You can customize the appearance of the messages sent by the script by modifying the `payload` table in the `server/main.lua` file. For example, you can change the `username` and `avatar_url` properties to use different values.\
[Read More On The Wiki](https://github.com/IMS-Network/Andrada-City/wiki/Discord-FiveM-Chat-Webhook-Sync)