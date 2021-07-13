--[Calling on resources for script to run -K]
pedManager = {
  [1] = {x = , y = , z = },
  [2] = {x = , y = , z = },
  [3] = {x = , y = , z = },
  [4] = {x = , y = , z = },
}

local vehicle = {}
local vehPlate = {}
local vehModel = {}
local vehicleData = {}

local ped = PlayerPedId()
local playerCoords = GetEntityCoords(ped)

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local inveh = (IsPedInAnyVehicle(ped, false))
Citizen.CreateThread(function()
  while true do
    inveh = (IsPedInAnyVehicle(ped, false))
    ped = PlayerPedId()
    playerCoords = GetEntityCoords(ped)  
    Wait(500)
  end
end)

hasFakePlate = false

RegisterNetEvent('urp-fakeplate:fakeplateUse')
AddEventHandler('urp-fakeplate:fakeplateUse', function()
		if hasFakePlate then return end
		local cStoreId = GetStoreId()


		if cStoreId ~= false then
			local sCoords = safeLocations[cStoreId]

			if #(vector3(sCoords['x'], sCoords['y'], sCoords['z']) - GetEntityCoords(PlayerPedId())) < 3.0 then
				TriggerServerEvent('urp-robbery:attemptSafeRobbery', cStoreId)
				return
			end

			local pCoords = GetEntityCoords(PlayerPedId())

			local rObject = GetClosestObjectOfType(pCoords, 2.0, 303280717, 0, 0, 0)
			local rSpot = GetOffsetFromEntityInWorldCoords(rObject, 0.0, -0.6, 0.0)

			if #(rSpot - pCoords) > 1.0 then
				TriggerEvent('DoLongHudText', 'You must be facing the front of the register to do this.')
				isLockpicking = false
				return
			end

			if rObject then
				local oHeading = GetEntityHeading(rObject)
				local pHeading = GetEntityHeading(PlayerPedId())
				if oHeading - pHeading > 20.0 and oHeading - pHeading < 340.0 then
					TriggerEvent('DoLongHudText', 'You must be facing register to do this.')
					isLockpicking = false
					return
				end
				TriggerServerEvent('urp-robbery:attemptRegisterRobbery', cStoreId, rObject)
				return
			end
		end
	else
		TriggerEvent('DoLongHudText', 'Not enough cops online', 2)
	end
end)