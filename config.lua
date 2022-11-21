Config = {}

Config = {
    --Locale = 'fr', -- Language available: fr, soon

    Color = 'r', -- Language available: b (blue), r (red), g (green)
    
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

    Touche = { -- TOUCHE MENU
        Noclip = 170, --F3
        Menu = 57, --F10
        MenuReport = 344, --F11
    }
}
