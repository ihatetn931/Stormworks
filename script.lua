
function onCustomCommand(full_message, user_peer_id, is_admin, is_auth, command, arg1, arg2, arg3, arg4)
	name = server.getPlayerName(user_peer_id)
	
	if command == "?gotoxyz" and is_admin == true then
		server.teleportPlayer(peer_id, matrix.translation(arg1,arg2,arg3))
		server.notify(user_peer_id, "[Server]","You Been Teleported to X:" ..arg1.. "- Y: "..arg2.." - Z:"..arg3, chat_message)
	end
	
	if command == "?goto" and is_admin == true then
		matrix = server.getPlayerPos(arg1)
		server.teleportPlayer(user_peer_id, matrix)
		server.notify(user_peer_id, "[Server]","You Been Teleported to "..server.getPlayerName(arg1), chat_message)
		server.notify(arg1, "[Server]",name.." Has Teleported to you", chat_message)
	end
	
	if command == "?gethere" and is_admin == true then
		matrix = server.getPlayerPos(peer_id)
		server.teleportPlayer(arg1, matrix)
		server.notify(peer_id, "[Server]","You Been Teleported to "..name, chat_message)
		server.notify(arg1, "[Server]","You Teleported ".. server.getPlayerName(arg1)" to You", chat_message)
	end
	
	if command == "?cleanv" and is_admin == true then
		server.cleanVehicles()
		server.announce("[Server]", "All Vehicles Cleaned Up")
	end
	
	if command == "?slap" and is_admin == true then
		playerPos = server.getPlayerPos(arg1)
		if arg1 ~= nil then
			server.teleportPlayer(arg1, matrix.translation(playerPos[13],playerPos[14] + 5, playerPos[15]))
			server.notify(arg1, "[Server]","You been Slapped by "..server.getPlayerName(user_peer_id), chat_message)
		else
			server.teleportPlayer(user_peer_id, matrix.translation(playerPos[13],playerPos[14] + 5, playerPos[15]))
			server.notify(user_peer_id, "[Server]","You slapped yourself for not entering an id", chat_message)
		end
	end
	
	if command == "?addp" and is_admin == true then
		server.addAuth(arg1)
	end
	
	if command == "?removep" and is_admin == true then
		server.removeAuth(arg1)
	end
	
	if command == "?adda" and is_admin == true then
		server.addAdmin(arg1)
	end
	
	if command == "?removea" and is_admin == true then
		server.removeAdmin(arg1)
	end
	
	if command == "?ban" and is_admin == true then
		server.addAdmin(arg1)
	end
	
	if command == "?clearchat" and is_admin == true then
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
		server.announce(" ","")
	end
	
	if command == "?kick" and is_admin == true then
		server.removeAdmin(arg1)
	end
	
	if command == "?test" and is_admin == true then
		server.announce("[Server]","DaysSurvived: "..server.getDateValue())
		server.announce("[Server]","Currency: $"..server.getCurrency())
		server.announce("[Server]","Research Points: "..server.getResearchPoints())
	end
	
	if command == "?help" then
		if is_admin == true then
			server.whisper(user_peer_id,"?cleanv Removes all vehicles from the map")
			server.whisper(user_peer_id, "?addp [id] Allow a Player to use workbenches")
			server.whisper(user_peer_id, "?removep [id] Removes Player use of workbenches")
			server.whisper(user_peer_id, "?adda [id] Add User As Admin")
			server.whisper(user_peer_id, "?removea [id] Remove users admin")
			server.whisper(user_peer_id, "?ban [id] Ban A Player")
			server.whisper(user_peer_id, "?kick [id] Kick A Player")
			server.whisper(user_peer_id, "?goto [id] Teleport to a player")
			server.whisper(user_peer_id, "?gotoxyz [X] [Y] [Z] Teleport to X Y Z Coords")
			server.whisper(user_peer_id, "?gethere [id] Teleport a player to you")
			server.whisper(user_peer_id, "?kill [[id]] Kill Yourself or a player")
			server.whisper(user_peer_id, "?slap [[id]] Slap a player or yourself")
			server.whisper(user_peer_id, "?clearchat Clear The Chat")
		else
			server.whisper(user_peer_id, "No Commands For Users Yet")
		end
	end	

	if command == "?kill" and is_admin == true then
		if arg1 ~= nil then
			server.killPlayer(arg1)
		else
			server.killPlayer(user_peer_id)
		end
	end
end

function onPlayerDie(steam_id, name, peer_id, is_admin, is_auth)
	server.announce("[Server]", name.." Shouldn't of done that (Dead)")
end

function onPlayerJoin(steam_id, name, peer_id, is_admin, is_auth)
	if is_admin == true then
		server.announce("[Server]", "[Id:"..peer_id.."][Admin]"..name.." Has Joined")
		server.notify(peer_id,"[Server]","Welcome, "..name.." Type ?help to see list of commands",chat_message)
	else
		server.announce("[Server]", "[Id:"..peer_id.."][Auth:"..is_auth.."] "..name.." Has Joined")
		if is_auth == false then
			server.addAuth(peer_id)
		end
	end
end

--function onVehicleLoad(vehicle_id)
--server.announce("[Server]", "Vehicle With Name Spawned: "..server.getVehicleName(vehicle_id))
--end

function onToggleMap(peer_id, is_open)
	pName = server,getPlayerName(peer_id)
	if is_open == true then
		server.announce("[Server]",pName.." Checked their map")
	end
end