# About Andrada CarLock
A Simple Car Lock Script

<div>
   <p>In this script, the first thing that happens is that the <code>ESX</code> variable is set up to be a reference to the shared object provided by the ESX framework. This shared object is a global object that contains all of the libraries and APIs provided by the ESX framework.</p>
   <p>Next, the script defines a function named <code>onVehicleEntered</code> which is called when a player tries to enter a vehicle. This function checks if the vehicle is locked to the player by checking its door lock status and license plate text. If the vehicle is locked to the player, the function cancels the event that would allow the player to enter the vehicle. This prevents other players from entering vehicles that are locked to specific players.</p>
   <p>The script also defines a function named <code>onKeyPressed</code> which is called when a player presses the 'M' key. This function checks if the player is in a vehicle and, if so, checks if the vehicle is locked to the player. If the vehicle is not locked to the player, the function locks it to the player by setting its door lock status and license plate text. If the vehicle is already locked to the player, the function unlocks it.</p>
   <p>Finally, the script registers the <code>onVehicleEntered</code> and <code>onKeyPressed</code> functions as event handlers for the <code>esx:onPlayerVehicleEnter</code> and <code>esx:playerLoaded</code> events respectively. The <code>esx:onPlayerVehicleEnter</code> event is triggered whenever a player tries to enter a vehicle, and the <code>esx:playerLoaded</code> event is triggered when a player finishes loading into the game world.</p>
   <p>Overall, this script provides a basic implementation of vehicle locking and unlocking in the ESX framework. It allows players to lock and unlock vehicles they are currently in, and prevents other players from entering vehicles that are locked to specific players.</p>
</div>
