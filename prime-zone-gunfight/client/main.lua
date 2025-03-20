local inZone = false
local currentZone = nil

-- Créer les blips et les zones
CreateThread(function()
    for _, zone in ipairs(Config.Zones) do
        -- Créer un blip pour la zone
        local blip = AddBlipForRadius(zone.coords.x, zone.coords.y, zone.coords.z, zone.radius)
        SetBlipSprite(blip, zone.blip.sprite)
        SetBlipColour(blip, zone.blip.color)
        SetBlipScale(blip, zone.blip.scale)
        SetBlipAlpha(blip, 128)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(zone.name)
        EndTextCommandSetBlipName(blip)

        -- Vérifier si le joueur entre ou sort de la zone
        while true do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - zone.coords)

            if distance <= zone.radius and not inZone then
                inZone = true
                currentZone = zone
                TriggerServerEvent('gunfight:enterZone', zone)
                lib.notify({
                    title = 'Gunfight',
                    description = 'Vous êtes entré dans la zone : ' .. zone.name,
                    type = 'inform'
                })
            elseif distance > zone.radius and inZone and currentZone == zone then
                inZone = false
                currentZone = nil
                TriggerServerEvent('gunfight:exitZone', zone)
                lib.notify({
                    title = 'Gunfight',
                    description = 'Vous avez quitté la zone : ' .. zone.name,
                    type = 'inform'
                })
            end

            Wait(1000)
        end
    end
end)