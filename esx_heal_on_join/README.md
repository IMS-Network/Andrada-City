# ESX Heal on Join

A simple FiveM script for ESX servers that heals players and sends a notification when they join the server.

## Installation

1. Download or clone this repository and place it in your server's resources folder.
2. Make sure to isolate this folder if you want to use this script only
3. Rename the folder to `esx_heal_on_join` if it is not already named as such.
4. Add `start esx_heal_on_join` to your server configuration file (usually `server.cfg`).

## Usage

The script will automatically heal players and send a notification when they join your ESX server. There is no additional configuration or commands required.

## Customization

If you would like to customize the message sent to players, you can modify the following line in the `server/main.lua` file:

```lua
TriggerClientEvent('esx:showNotification', playerId, 'Welcome! You have been healed!')
```
Change the text `Welcome! You have been healed!` to the desired message.

### Support
This script is provided as-is, and it may not cover all edge cases or be fully optimized. You are free to modify, expand, or customize the script to better suit your server's needs. If you encounter issues, please ensure your ESX framework is up-to-date and that the script is properly installed.


