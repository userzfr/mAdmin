Config = {}

Config = {
    --Locale = 'fr', -- Language available: fr, soon

    --Color = 'b', -- Language available: b (blue), r (red), g (green)

    webhook = { -- LOGS DISCORD
        Staffmodeon = "DISCORD_WEBHOOK",      -- MODE STAFF ON
        Staffmodeoff = "DISCORD_WEBHOOK",     -- MODE STAFF OFF
        teleport = "DISCORD_WEBHOOK",        -- BRING LOGS
        teleportTo = "DISCORD_WEBHOOK",         -- GOTO LOGS
        revive = "DISCORD_WEBHOOK",        -- REVIVE LOGS
        kick = "DISCORD_WEBHOOK",        -- KICK/BAN LOGS
        SendLogs = "DISCORD_WEBHOOK",        -- GENERAL LOGS
        report = "DISCORD_WEBHOOK"        -- REPORT LOGS
    },

    Tennue = { -- VETEMENT
    bag = 0,
    bag2 = 0,
    tshirt = 15,
    tshirt2 = 2,
    torso = 204,
    torso2 = 5, 
    arms = 31,
    pants = 87,
    pants2 = 5,
    shoes = 56,
    shoes2 = 5,
    mask = 0,
    mask2 = 0,
    bproof = 0,
    chain = 0,
    helmet = 62,
    helmet2 = 0,
    },

    Grade = { -- Nom des grades
    user = "Joueurs",
    help = "Helpeur",
    mod = "Modo",
    admin = "Admin",
    superadmin = "Super Admin",
    owner = "owner",
    _dev = "Dev",
    },

    --Events = {
    --    ["DRUGS"] = { --Ne pas toucher
    --        type = "drugs", --Ne pas toucher
    --        message = "Une cargaison de drogue a été trouvée ! Viens la récupérer avant la Police !", -- Modifié par votre messsage
    --        possibleZone = {
    --            vector3(488.5908, -3362.791, 6.069853), -- Modifié par les différentes position
    --            vector3(-2119.944, -494.6833, 3.23038),
    --            vector3(-1241.547, -1842.904, 2.140611),
    --        },
    --        prop = {
    --            "bkr_prop_coke_box_01a", --Ne pas toucher
    --            "bkr_prop_coke_doll_bigbox", --Ne pas toucher
    --            "bkr_prop_weed_bigbag_01a", --Ne pas toucher
    --            "bkr_prop_weed_bigbag_02a", --Ne pas toucher
    --            "bkr_prop_weed_bigbag_03a", --Ne pas toucher
    --            "bkr_prop_weed_bigbag_open_01a", --Ne pas toucher
    --            "bkr_prop_weed_bucket_01a", --Ne pas toucher
    --            "bkr_prop_weed_bucket_01b", --Ne pas toucher
    --            "bkr_prop_weed_bucket_01c", --Ne pas toucher
    --        },
    --        item = { -- Relié a vos items de drogues illégals
    --            "weed_pochon",
    --            "coke_pochon",
    --            "opium_pochon", 
    --            "meth_pochon", 
    --            "lsd_pochon",
    --            "resine_pochon",
    --        },
    --    },
    --    ["BRINKS"] = { --Ne pas toucher
    --        type = "brinks", --Ne pas toucher
    --        message = "Un fourgon blindé vient de se faire pété ! Viens récupérer l'argent avant la Police !", --Modifié le message
    --        possibleZone = { -- Modifié par vos poses ou pas toucher
    --            vector3(18.79272, -1073.074, 38.15213),
    --            vector3(55.42496, -1672.947, 29.29726),
    --            vector3(776.0305, -2064.744, 29.3819),
    --            vector3(862.7224, -913.9108, 25.94606),
    --        },
    --        prop = { -- Reegarder coté serveur pour le montant d'argent
    --            "bkr_prop_moneypack_01a",
    --            "bkr_prop_moneypack_02a",
    --            "bkr_prop_moneypack_03a",
    --        },
    --    },
    --    ["CAISSE"] = {
    --        type = "caisse", -- Ne pas toucher
    --        message = "~g~EVENEMENT EN COURS\n~w~Nous venons de retrouver une cargaison de caisse mystère !", -- Modifié par votre message
    --        possibleZone = { -- Modifié les poses ou pas toucher
    --            vector3(646.7936, 585.9033, 128.9108),
    --            vector3(328.4607, 346.0337, 105.288),
    --            vector3(-327.9891, -2700.65, 7.549608)
    --        },
    --        prop = { -- Ne pas toucher
    --            "prop_apple_box_01",
    --        },
    --        item = { -- Rélié a votre system de boutique
    --            "caisse",
    --        },
    --    },
    --},
--
    --EventActif = {}, --Ne pas toucher
    --EventTypeIndex = 1, --Ne pas toucher
    --JobsList = {}, --Ne pas toucher
    --TimeEvent = {}, --Ne pas toucher
    --MaxJoueurs = {}, --Ne pas toucher
    --IndexTimeEvent = 1, --Ne pas toucher

    Touche = { -- TOUCHE MENU
        Noclip = 170, --F3
        Menu = 57, --F10
        MenuReport = 344, --F11
    }
}
