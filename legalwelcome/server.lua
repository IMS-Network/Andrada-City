AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local count = GetNumPlayerIndices()
    local maxPlayers = GetConvarInt("sv_maxclients", 64)
    
    deferrals.update("IMS - Network FiveM | Andrada City\nWelcome, " .. playerName .. ".\nWe are currently asking you a question.\n\nPlease wait...")
    
    local card = {
        type = "AdaptiveCard",
        body = {
            {
                type = "TextBlock",
                text = string.format("IMS - Network FiveM | Andrada City\nWelcome, %s.\nThere are %s/%s players connected.\n\nDo you wish to connect?\nBy Connecting to the server you agree to our TOS and Privacy Policy", playerName, count, maxPlayers),
                weight = "Bold",
                size = "Large",
            },
            {
                type = "ActionSet",
                actions = {
                    {
                        type = "Action.Submit",
                        title = "Yes",
                        style = "positive",
                        data = {
                            success = true,
                        },
                    },
                    {
                        type = "Action.Submit",
                        title = "No",
                        style = "negative",
                        data = {
                            success = false,
                        },
                    },
                },
            },
        },
    }

    local function CheckChoice(data)
        if (data and data.success ~= nil) then
            if (data.success) then
                if (count >= maxPlayers) then
                    setKickReason("IMS - Network FiveM Andrada City\n\nServer is currently full, try again later!\n\nSorry :(")
                else
                    deferrals.done()
                end
            else
                setKickReason("IMS - Network FiveM Andrada City\n\nYou chose not to connect.\n\nHave A Good Day")
            end
        else
            setKickReason("IMS - Network FiveM Andrada City\n\nInvalid response received.\n\nPlease try again.")
        end
    end

    deferrals.presentCard(card, CheckChoice)
end)
