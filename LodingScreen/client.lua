--Copyright Inferno-collection for this code. All code in this client.lua file is written by him. I do not take credit for anything in this document

-- Variable to check if native has already been run
local Ran = false

-- Wait until client is loaded into the map
AddEventHandler("playerSpawned", function ()
	-- If not already ran
	if not Ran then
		-- Close loading screen resource
		ShutdownLoadingScreenNui()
		-- Set as ran
		Ran = true
	end
end)