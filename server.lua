RegisterServerEvent('unity:plate-read-up')
AddEventHandler('unity:plate-read-up', function()
    local src = source
    local user = exports["urp-framework"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.ghmattimysql:execute("SELECT information FROM user_inventory2 WHERE name = ? AND item_id = ? ORDER BY slot DESC", {invname, "fakeplate"}, function(data)
        if data[1] then
            local jsonparse = json.decode(data[1].information)
            TriggerClientEvent('unity-set:plate', src, jsonparse)
        end
    end)
end)