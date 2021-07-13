local cunt = {"A", "B", "C", "D", "E", "F", "D", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",}

    if exports['urp-inventory']:hasEnoughOfItem('fakeplate', 1) then
        TriggerServerEvent('unity:plate-read-up')
    end

RegisterNetEvent('unity:generate-fakeplate')
AddEventHandler('unity:generate-fakeplate', function()
    local information = {
        ["plate"] = math.random(00, 99) .. '' .. cunt[math.random(1, 26)] .. '' .. cunt[math.random(1, 26)] .. '' .. cunt[math.random(1, 26)] .. '' .. math.random(000, 999)
    }
    TriggerEvent("player:receiveItem","fakeplate",1,false,information)
end)

RegisterNetEvent('unity-set:plate')
AddEventHandler('unity-set:plate', function(plate)
    TriggerEvent('inventory:removeItem', 'fakeplate', 1)
    local finished = exports['urp-taskbar']:taskBar(10000, 'Changing plate', false, false, false)
    TriggerEvent('inventory:giveItem', 'licenceplate', 1 )
    TriggerEvent('DoLongHudText', 'You have changed the plate on this car!', 1)
    SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false), plate["Plate"])
    TriggerEvent("keys:addNew",GetVehiclePedIsIn(PlayerPedId(), false),plate["Plate"])
end)