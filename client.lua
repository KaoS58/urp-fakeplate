local cunt = {"A", "B", "C", "D", "E", "F", "D", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",}

-- RegisterCommand('t', function(source) (Do we need this if its running through 3rd eye?)
    if exports['urp-inventory']:hasEnoughOfItem('fakeplate', 1) then
        TriggerServerEvent('unity:plate-read-up')
    end
end)

RegisterNetEvent('unity:generate-fakeplate')
AddEventHandler('unity:generate-fakeplate', function()
    local information = {
        ["plate"] = cunt[math.random(1, 26)] .. '' .. math.random(, )
    }
    TriggerEvent("player:receiveItem","fakeplate",1,false,information)
end)

RegisterNetEvent('unity-set:plate')
AddEventHandler('unity-set:plate', function(plate)
    TriggerEvent('inventory:removeItem', 'fakeplate', 1)
    SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false), plate["Plate"])
    TriggerEvent("keys:addNew",GetVehiclePedIsIn(PlayerPedId(), false),plate["Plate"])
end)