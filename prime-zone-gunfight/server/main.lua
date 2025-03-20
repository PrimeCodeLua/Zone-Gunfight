local ESX = exports['es_extended']:getSharedObject()

-- Événement pour entrer dans une zone
RegisterNetEvent('gunfight:enterZone')
AddEventHandler('gunfight:enterZone', function(zone)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    -- Donner les armes et munitions
    for _, weapon in ipairs(zone.weapons) do
        xPlayer.addWeapon(weapon.name, weapon.ammo)
    end
end)

-- Événement pour quitter une zone
RegisterNetEvent('gunfight:exitZone')
AddEventHandler('gunfight:exitZone', function(zone)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    -- Supprimer toutes les armes
    for _, weapon in ipairs(zone.weapons) do
        xPlayer.removeWeapon(weapon.name)
    end

    -- Spawner le véhicule de sortie
    local vehicle = CreateVehicle(zone.vehicle, zone.coords.x, zone.coords.y, zone.coords.z, 0.0, true, false)
    TaskWarpPedIntoVehicle(GetPlayerPed(playerId), vehicle, -1)
end)