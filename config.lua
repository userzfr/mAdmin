local AeroEvent = TriggerServerEvent
Config = {}

Config = {
    --Locale = 'fr', -- Language available: fr, soon
    
    webhook = { -- LOGS DISCORD
        Staffmodeon = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",      -- MODE STAFF ON
        Staffmodeoff = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",     -- MODE STAFF OFF
        teleport = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",        -- BRING LOGS
        teleportTo = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",         -- GOTO LOGS
        revive = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",        -- REVIVE LOGS
        kick = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",        -- KICK/BAN LOGS
        SendLogs = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9",        -- GENERAL LOGS
        report = "https://discord.com/api/webhooks/1060264888037036153/JBGZg6qeAgoEc8oFnGV93mP8Ap6nElgPR3KOueN2rk89Aa1eOxaBOccZ2eVFviPwS1_9"        -- REPORT LOGS
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
    _dev = "Fondateur",
    },

    Touche = { -- TOUCHE MENU
        Noclip = 170, --F3
        Menu = 57, --F10
        MenuReport = 344, --F11
    }
}