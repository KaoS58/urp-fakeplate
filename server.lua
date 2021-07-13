RegisterServerEvent('urp-fakeplate:startchangePlateFake')
AddEventHandler('urp-fakeplate:giveloadout', function()
    TriggerClientEvent('player:removeItem', source, 'fakeplate', 1)
end)

RegisterServerEvent('urp-fakeplate:removeloadout')
AddEventHandler('urp-fakeplate:removeloadout', function()
    TriggerClientEvent('urp-fakeplate:receiveItem', source, 'licenseplate', 1)
end)