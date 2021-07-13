
local gui = false
local currentlyInGame = false
local passed = false;


function fakeplate(platehealth, platedamage, platePadding, distance)
  openGui()
  play(platehealth,platedamage,platePadding,distance)
  currentlyInGame = true
  while currentlyInGame do
    Wait(400)
    if exports["isPed"]:isPed("dead") then 
      closeGui()
    end 
  end

  if passed then 
    return 100 
  else
    TriggerEvent("inventory:removeItem","fakeplate", 1)
    TriggerClientEvent('DoLongHudText', _source, 'You have began to change the plates on this vehicle!', 1)
    return 0 
  end
end

function openGui()
    gui = true
    SetNuiFocus(true,true)
    SendNUIMessage({openPhone = true})
end


function play(platehealth,platedamage,platePadding,distance) 
  SendNUIMessage({openSection = "playgame", health = platehealth,damage = platedamage,padding = platePadding,solveDist = distance})
end

function CloseGui()
    currentlyInGame = false
    gui = false
    SetNuiFocus(false,false)
    SendNUIMessage({openPhone = false})
end

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  passed = false
  CloseGui()
  cb('ok')
end)

RegisterNUICallback('failure', function(data, cb)
  passed = false
  TriggerEvent("evidence:bleeding")
  CloseGui()
  cb('ok')
end)

RegisterNUICallback('complete', function(data, cb)
  passed = true
  CloseGui()
  cb('ok')
  TriggerClientEvent('DoLongHudText', _source, 'You have successfully changed the plates on this vehicle!', 1)
end)