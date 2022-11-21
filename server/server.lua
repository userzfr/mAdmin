--================================--
--         Trigger ESX            --
--================================--

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

--================================--
--         VERSION CHECK          --
--================================--

-- En Dev . . .

--================================--
--         Début du script        --
--================================--

local staff = {}
local allreport = {}
local reportcount = {}

--================================--
--         Commande Report        --
--================================--

RegisterCommand('report', function(source, args, user)
    local xPlayerSource = ESX.GetPlayerFromId(source)
    local isadded = false
    for k,v in pairs(reportcount) do
        if v.id == source then
            isadded = true
        end
    end
    if not isadded then
        table.insert(reportcount, { 
            id = source,
            gametimer = 0
        })
    end
    for k,v in pairs(reportcount) do
        if v.id == source then
            if v.gametimer + 120000 > GetGameTimer() and v.gametimer ~= 0 then
                TriggerClientEvent('esx:showAdvancedNotification', source, 'SUPPORT', '~'.. Config.Color ..'~'..GetPlayerName(source)..'', 'Vous devez patienter ~r~2 minute~s~ avant de faire de nouveau un ~r~report !', 'CHAR_BLOCKED', 0)
                return
            else
                v.gametimer = GetGameTimer()
            end
        end
    end
    TriggerClientEvent('esx:showAdvancedNotification', source, 'REPORT', '~'.. Config.Color ..'~' ..GetPlayerName(source).. '', 'Votre Report a bien été envoyé ', 'CHAR_CHAT_CALL', 0)
    PerformHttpRequest(Config.webhook.report, function(err, text, headers) end, 'POST', json.encode({username = "REPORT", content = "``REPORT``\n```ID : " .. source .. "\nNom : " .. GetPlayerName(source) .. "\nMessage : " .. table.concat(args, " ") .. "```"}), { ['Content-Type'] = 'application/json' })
    table.insert(allreport, {
        id = source,
        name = GetPlayerName(source),
        reason = table.concat(args, " ")
    })
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getGroup() == "help" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'REPORT', 'Nouveaux report de ~r~'..GetPlayerName(source)..' ~s~| ~'.. Config.Color ..'~'..source..'', 'Message: ~n~~u~'.. table.concat(args, " "), 'CHAR_CHAT_CALL', 0)
            TriggerClientEvent("mAdmin:RefreshReport", xPlayer.source)
        end
    end
end)

--================================--
--         Prise rôle IG          --
--================================--

ESX.RegisterServerCallback('mAdmin:getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
end)

--================================--
--         Envoyer le logs        --
--================================--

RegisterServerEvent("mAdmin:SendLogs")
AddEventHandler("mAdmin:SendLogs", function(action)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest(Config.webhook.SendLogs, function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nNom : " .. GetPlayerName(source) .. "\nAction : ".. action .." !```" }), { ['Content-Type'] = 'application/json' })
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

--================================--
--     Prise/Leave mode staff     --
--================================--

RegisterServerEvent("mAdmin:onStaffJoin")
AddEventHandler("mAdmin:onStaffJoin", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getGroup() == "help" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'STAFF MODE', '', '~'.. Config.Color ..'~'..GetPlayerName(source)..'~s~ à ~g~activer~s~ son StaffMode ', 'CHAR_BUGSTARS', 0)
        end
    end
    if xPlayer.getGroup() ~= "user" then
        print(GetPlayerName(source) ..' ^2Activer^0 StaffMode^0')
        PerformHttpRequest(Config.webhook.Staffmodeon , function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "``STAFF MODE ON``\n```\nNom : " .. GetPlayerName(source) .. "\nAction : Active Staff Mode !```" }), { ['Content-Type'] = 'application/json' })
        table.insert(staff, source)
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:onStaffLeave")
AddEventHandler("mAdmin:onStaffLeave", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getGroup() == "help" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'STAFF MODE', '', '~'.. Config.Color ..'~'..GetPlayerName(source).. '~s~ à ~r~désactiver~s~ son StaffMode ', 'CHAR_BUGSTARS', 0)
        end
    end
    if xPlayer.getGroup() ~= "user" then
        print(GetPlayerName(source) ..' ^1Désactiver^0 StaffMode^0')
        PerformHttpRequest(Config.webhook.Staffmodeoff , function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "``STAFF MODE OFF``\n```\nNom : " .. GetPlayerName(source) .. "\nAction : Désactive Staff Mode !```" }), { ['Content-Type'] = 'application/json' })
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

--================================--
--           Intéraction          --
--================================--

RegisterServerEvent("mAdmin:teleport")
AddEventHandler("mAdmin:teleport", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest(Config.webhook.teleport , function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "``TELEPORT``\n```\nNom : " .. GetPlayerName(source) .. "\nAction : Téléporter aux joueurs ! " .. "\n\n" .. "Nom de la personne : " .. GetPlayerName(id) .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("mAdmin:teleport", source, GetEntityCoords(GetPlayerPed(id)))
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:teleportTo")
AddEventHandler("mAdmin:teleportTo", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest(Config.webhook.teleportTo , function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "``TELEPORT SUR SOI MEME``\n```\nNom : " .. GetPlayerName(source) .. "\nAction : Téléportez les joueurs à l'administrateur ! " .. "\n\n" .. "Nom de la personne : " .. GetPlayerName(id) .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("mAdmin:teleport", id, GetEntityCoords(GetPlayerPed(source)))
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:Revive")
AddEventHandler("mAdmin:Revive", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest(Config.webhook.revive, function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "``REVIVE``\n```\nNom : " .. GetPlayerName(source) .. "\nAction : Revive ! " .. "\n\n" .. "Nom de la personne revive : " .. GetPlayerName(id) .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("esx_ambulancejob:revive", id)
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:teleportcoords")
AddEventHandler("mAdmin:teleportcoords", function(id, coords)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        TriggerClientEvent("mAdmin:teleport", id, vector3(215.76, -810.12, 30.73))
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:kick")
AddEventHandler("mAdmin:kick", function(id, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest(Config.webhook.kick, function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "``KICK``\n```\nNom : " .. GetPlayerName(source) .. "\nAction : Kick Players ! " .. "\n\n" .. "Nom de la personne  : " .. GetPlayerName(id) .. "\n" .. "Reason : " .. reason .. "```" }), { ['Content-Type'] = 'application/json' })
        DropPlayer(id, reason)
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:Ban")
AddEventHandler("mAdmin:Ban", function(id, temps, raison)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        TriggerEvent("SqlBan:mAdminBan", id, temps, raison, source)
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("mAdmin:ReportRegle")
AddEventHandler("mAdmin:ReportRegle", function(idt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        for i, v in pairs(allreport) do
            if i == idt then
                TriggerClientEvent('esx:showAdvancedNotification',  v.id, '[Assistance]', '', '~g~Votre report a été réglée !', 'CHAR_CHAT_CALL', 0)
            end
        end
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Administration', '~r~Informations', 'Le ~r~Report~s~ a bien été cloturé ', 'CHAR_SUNLITE', 2)
        allreport[idt] = nil
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

ESX.RegisterServerCallback('mAdmin:retrievePlayers', function(playerId, cb)
    local players = {}
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        table.insert(players, {
            id = "0",
            group = xPlayer.getGroup(),
            source = xPlayer.source,
            jobs = xPlayer.getJob().name,
            name = xPlayer.getName()
        })
    end

    cb(players)
end)

ESX.RegisterServerCallback('mAdmin:retrieveStaffPlayers', function(playerId, cb)
    local playersadmin = {}
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getGroup() ~= "user" then
        table.insert(playersadmin, {
            id = "0",
            group = xPlayer.getGroup(),
            source = xPlayer.source,
            jobs = xPlayer.getJob().name,
            name = xPlayer.getName()
        })
    end
end

    cb(playersadmin)
end)

--================================--
--             Touche             --
--================================--

RegisterServerEvent("mAdmin:noclipkey")
AddEventHandler("mAdmin:noclipkey", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "help" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "_dev" then
        TriggerClientEvent("mAdmin:noclipkey", source)    
    end
end)


RegisterServerEvent("mAdmin:ouvrirmenu1")
AddEventHandler("mAdmin:ouvrirmenu1", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "help" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "_dev" then
        TriggerClientEvent("mAdmin:menu1", source)        
    end
end)

RegisterServerEvent("mAdmin:ouvrirmenu2")
AddEventHandler("mAdmin:ouvrirmenu2", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "help" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "_dev" then
        TriggerClientEvent("mAdmin:menu2", source)    
    end
end)


ESX.RegisterServerCallback('mAdmin:retrieveReport', function(playerId, cb)
    cb(allreport)
end)

RegisterNetEvent("mAdmin:Message")
AddEventHandler("mAdmin:Message", function(id, type)
	TriggerClientEvent("mAdmin:envoyer", id, type)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        TriggerClientEvent("mAdmin:envoyer", id, type)
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)