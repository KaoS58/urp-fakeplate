-- Coords for plate making shit + Ped Manager info

RegisterServerEvent('urp-fakeplate:giveloadout')
AddEventHandler('urp-fakeplate:giveloadout', function()
    TriggerClientEvent('player:removeItem', source, 'fakeplate', 1)
end)

RegisterServerEvent('urp-fakeplate:removeloadout')
AddEventHandler('urp-fakeplate:removeloadout', function()
    TriggerClientEvent('urp-fakeplate:receiveItem', source, 'licenseplate', 1)
end)