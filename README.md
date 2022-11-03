### 🛠 Requirements

- FXServer With at least build: `5562`
- screenshot-basic
- A Discord Server

### ✅ Main Features
- Basic logs:
    - Chat Logs (Messages typed in chat.)
    - Join Logs (When i player is connecting to the sever.)
    - Leave Logs (When a player disconnects from the server.)
    - Death Logs (When a player dies/get killed.)
    - Shooting Logs (When a player fires a weapon.)
    - Resource Logs (When a resouce get started/stopped.)
    - Explosion Logs (When a player creates an explosion.)
    - Namechange Logs (When someone changes their steam name.)
- Screenshot Logs (You can add screenshot of the players game to your logs.)
- Optional custom logs
    - Easy to add with the export.

### 🔧 Download & Installation

1. Download the latest version from [github](https://github.com/Matdbx10/menuAdmin)
  - Click the `Code` button and then `Download ZIP`
  ![](https://prefech.com/i/424808e1-f68a-4af3-b697-5c7e8cd32290 "Clone Screen")
2. Put the JD_logsV3 folder in the server resource directory
    - Make sure to rename the folder to JD_logsV3.
3. Get yourself the bot token(s) and add them in the config/config.json
    - Not sure how to get a bot token? [How to get a bot token](https://forum.prefech.com/d/12-how-to-get-a-discord-bot-token).
    - The bots need to have the following intents enabled:
        - Presence Intent
        - Server Members Intent
        - Message Content Intent
4. Add this to your server.cfg
```cfg
ensure menuAdmin
```
5. Start the resource once and let it build.
6. Go to your discord where you invited the bot (The one where you want your new main logs to be.) 7. and use the command !jdlogs setup.
    - Make sure the first bot (The one with the token at 1) has permissions to send messages, create channels and create webhooks.
    - All other bots just need permission to send messages in the channels.
7. Restart your server and you will see the logs on your discord.