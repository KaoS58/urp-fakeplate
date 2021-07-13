--[Calling on resources for script to run -K]

local vehicle = {}
local vehPlate = {}
local vehModel = {}
local vehicleData = {}

local ped = PlayerPedId()
local playerCoords = GetEntityCoords(ped)

local inveh = (IsPedInAnyVehicle(ped, false))
Citizen.CreateThread(function()
  while true do
    inveh = (IsPedInAnyVehicle(ped, false))
    ped = PlayerPedId()
    playerCoords = GetEntityCoords(ped)  
    Wait(500)
  end
end)

--[Proper Scripting here HACKERMANS -K]
RegisterNetEvent('changePlateFake')
AddEventHandler('changePlateFake', function()
  if   --If the player has the fake plate in pockets, run the event, if not then pring error
	startchangePlateFake()
	TriggerClientEvent('DoLongHudText', _source, 'You have began to change the plates on this vehicle!', 2)
end)

-- End of event where player gets the old plate
RegisterNetEvent('changePlateFakeHud')
AddEventHandler('changePlateFakeHud', function()
	TriggerClientEvent('DoLongHudText', _source, 'You have sucessfully changed the plates on this vehicle!', 2)
  TriggerClientEvent('DoLongHudText', _source, 'You have recieved the old plates of the car!', 2)
end)