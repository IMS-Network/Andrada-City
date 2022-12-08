-- This script syncs with a Discord webhook and relays all messages to a Discord channel

-- Set the webhook URL and the Discord channel ID
local WEBHOOK_URL = "YOUR_WEBHOOK_URL_HERE"
local CHANNEL_ID = "YOUR_CHANNEL_ID_HERE"

-- This function is called when the script is loaded
function Initialize()
  -- Set the event handler for when a message is received
  AddEventHandler("chatMessage", function(playerId, playerName, message)
    -- If the message is not from the FiveM server, relay it to the Discord channel
    if playerId ~= 0 then
      -- Build the message payload
      local payload = {
        content = message,
        username = playerName,
        avatar_url = "https://i.imgur.com/YOUR_IMAGE_URL_HERE.png",
      }

      -- Send the payload to the Discord webhook
      PerformHttpRequest(WEBHOOK_URL, function(err, text, headers) end, "POST", json.encode(payload), { ["Content-Type"] = "application/json" })
    end
  end)
end