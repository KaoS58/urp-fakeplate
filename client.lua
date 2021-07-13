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

RegisterNetEvent('changePlateFake')
AddEventHandler('changePlateFake', function()
	startchangePlateFake()
	Citizen.Trace("1")
end)

RegisterNetEvent('changePlateFakeHud')
AddEventHandler('changePlateFakeHud', function()
	startGolfHud()
	Citizen.Trace("HUD started")
end)