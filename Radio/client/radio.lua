-- client/radio.lua

-- Define the custom radio stations
local stations = {
  {name = "My Radio Station 1", url = "https://example.com/station1.mp3"},
  {name = "My Radio Station 2", url = "https://example.com/station2.mp3"},
  {name = "My Radio Station 3", url = "https://example.com/station3.mp3"},
  ...
}

-- Set the audio flag to allow custom URLs to be played as radio stations
SetAudioFlag("AllowCustomUrl", true)

-- Add the custom radio stations to the game
Citizen.CreateThread(function()
  for i,station in ipairs(stations) do
    AddRadioStation(station.name, station.url)
  end
end)
