Config = {
    Zones = {
        {
            name = "Zone 1",
            coords = vector3(100.0, -200.0, 30.0), -- Coordonnées de la zone
            radius = 50.0, -- Rayon de la zone
            blip = {
                sprite = 303, -- Sprite du blip
                color = 1, -- Couleur du blip
                scale = 1.0 -- Taille du blip
            },
            weapons = {
                { name = "WEAPON_PISTOL", ammo = 100 }, -- Arme et munitions
                { name = "WEAPON_KNIFE", ammo = 1 }
            },
            vehicle = "baller" -- Véhicule de sortie
        },
        {
            name = "Zone 2",
            coords = vector3(300.0, -500.0, 30.0),
            radius = 75.0,
            blip = {
                sprite = 303,
                color = 2,
                scale = 1.0
            },
            weapons = {
                { name = "WEAPON_ASSAULTRIFLE", ammo = 200 },
                { name = "WEAPON_PISTOL", ammo = 50 }
            },
            vehicle = "sultan"
        }
        -- Ajoute d'autres zones ici
    }
}