ESX = nil
local HasAlreadyEnteredMarker = false
local LastStation             = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)




function MenuCar()
    local sMenuCar = RageUI.CreateMenu("Garage", "Garage du LSPD")
    sMenuCar:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuCar, not RageUI.Visible(sMenuCar))
    while sMenuCar do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuCar, true, true,true, function()
  
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then 
                RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Crown Victoria : ~y~[LSPD]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    
                Citizen.Wait(0)  
                spawnuniCar("police")
                RageUI.CloseAll()
                end
            end)

            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Intervention : ~y~[LSPD]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    
                Citizen.Wait(0)  
                spawnuniCar("police2")
                RageUI.CloseAll()
                end
            end)


            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Interceptor : ~y~[LSPD]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    
                Citizen.Wait(0)  
                spawnuniCar("police3")
                RageUI.CloseAll()
                end
            end)


            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Bike : ~y~[LSPD]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    
                Citizen.Wait(0)  
                spawnuniCar("policeb")
                RageUI.CloseAll()
                end
            end)


            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Transporter : ~y~[LSPD]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    
                Citizen.Wait(0)  
                spawnuniCar("policet")
                RageUI.CloseAll()
                end
            end)


            

        else

            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Crown Victoria : ~y~[LSPD]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                end
            end)
            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Intervention : ~y~[LSPD]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                end
            end)
            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Interceptor : ~y~[LSPD]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                end
            end)
            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Bike : ~y~[LSPD]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                end
            end)
            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Transporter : ~y~[LSPD]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                end
            end)
        end

    

        if  ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then

            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Granger : ~y~ [SWAT]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    Citizen.Wait(0)  
                    spawnuniCar("fbi2")
                    RageUI.CloseAll()
                end
            end)
            
            RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Insurgent : ~y~ [SWAT]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    Citizen.Wait(0)  
                    spawnuniCar3("policeinsurgent")
                    RageUI.CloseAll()
                end
            end)

            RageUI.ButtonWithStyle("÷ Véhicule - ~b~  BMR  : ~y~ [BMR]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar("r1200rtp")
            RageUI.CloseAll()
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ GT-63 : ~y~[VIR]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar("rmodgt63police")
            RageUI.CloseAll()
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~  Jeep  : ~y~ [VIR]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar2("rmodjeepp")
            RageUI.CloseAll()
            end
        end)
       
        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Maserati : ~y~[VIR]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar("ghispo2")
            RageUI.CloseAll()
            end
        end)

    else

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Granger : ~y~[SWAT]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Insurgent : ~y~[SWAT]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~  BMR  : ~y~[BMR]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Jeep : ~y~[VIR]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ GT-63 : ~y~[VIR]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Maserati : ~y~[VIR]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
    end

    if ESX.PlayerData.job.grade_name == 'boss' then

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Bus Pénitencier : ~y~[CMDT]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar3("pbus")
            RageUI.CloseAll()
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Banalisé : ~y~[CMDT]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar("police4")
            RageUI.CloseAll()
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Felon : ~y~[CMDT]", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            Citizen.Wait(0)  
            spawnuniCar("policefelon")
            RageUI.CloseAll()
            end
        end)

    else

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Bus Pénitencier : ~y~[CMDT]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)

        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Banalisé : ~y~[CMDT]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        
        RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Felon : ~y~[CMDT]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
            if (Selected) then
            end
        end)
        
    end


        
            end, function()
            end)
        if not RageUI.Visible(sMenuCar) then
            sMenuCar = RMenu:DeleteType("Armurerie", true)
        end
    end
end







    positioncar = {
        {
            Zones = "Zones1",
            x = 441.33, y = -985.176, z = 25.699
        },
    }
    

local interval = 1000
InZone = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        for k,v in pairs(position)do 
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, positioncar[k].x, positioncar[k].y, positioncar[k].z)
                if distance <= 7.0  then
                    interval = 0
                    InZone[v.Zones] = true
                    DrawMarker(20, positioncar[k].x, positioncar[k].y, positioncar[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                else
                    if InZone[v.Zones] then
                        interval = 1000
                        InZone[v.Zones] = false
                    end
                end
                if distance <= 2.0 then
                    interval = 0
                    InZone[v.Zones] = true 
                    RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour accéder au garage", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        MenuCar()
                     end
    
                end  
                
            end 
        end
    end
end)
   

function spawnuniCar(car)
    local car = GetHashKey(car)
    local pos = FoundClearSpawnPoint(config.garage.pos)
    if pos ~= false then
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, pos.pos, pos.heading, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        local plaque = "LSPD"..math.random(1,9)
        SetVehicleNumberPlateText(vehicle, plaque) 
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
        SetVehicleMaxMods(vehicle)
        SetVehicleFuelLevel(vehicle,10000)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetVehicleLivery(vehicle, 0)
        SetVehicleExtra(vehicle, -1, true)
    else
        ShowNotification("Aucun point de sortie disponible")
    end        
         
end


function spawnuniCar2(car)
    local car = GetHashKey(car)
    local pos = FoundClearSpawnPoint(config.garage.pos)
    if pos ~= false then
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, pos.pos, pos.heading, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        local plaque = "LSPD"..math.random(1,9)
        SetVehicleNumberPlateText(vehicle, plaque) 
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
        SetVehicleMaxMods(vehicle)
        SetVehicleFuelLevel(vehicle,10000)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetVehicleLivery(vehicle, 2)
        SetVehicleExtra(vehicle, -1, true)
    else
        ShowNotification("Aucun point de sortie disponible")
    end   
         
end

function spawnuniCar3(car)
    local car = GetHashKey(car)
    local pos = FoundClearSpawnPoint(config.garage.pos)
    if pos ~= false then
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, vector3(441.23, -1021.93, 28.5745), 87.14, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        local plaque = "LSPD"..math.random(1,9)
        SetVehicleNumberPlateText(vehicle, plaque)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
        SetVehicleMaxMods(vehicle)
        SetVehicleLivery(vehicle, 0)
        SetVehicleFuelLevel(vehicle,10000)
        SetVehicleExtra(vehicle, -1, true)
    else
        ShowNotification("Aucun point de sortie disponible")
    end        
         
end

function FoundClearSpawnPoint(zones)
	local found = false
	local count = 0
	for k,v in pairs(zones) do
		local clear = IsSpawnPointClear(v.pos, 2.0)
		if clear then
			found = v
			break
		end
	end
	return found
end

function IsSpawnPointClear(coords, radius)
	local vehicles = GetVehiclesInArea(coords, radius)

	return #vehicles == 0
end

function GetVehiclesInArea (coords, area)
	local vehicles       = GetVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function GetVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end
function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function SetVehicleMaxMods(vehicle)
    local props = {
      modEngine       = 2,
      modBrakes       = 4,
      modTransmission = 4,
      modSuspension   = 4,
      modTurbo        = true,
    }
    ESX.Game.SetVehicleProperties(vehicle, props)
  end

  
  ------------------------ HELICO




      function spawnuniHeli(car)
        local car = GetHashKey(car)
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, Config.spawn.spawnheli.position.x, Config.spawn.spawnheli.position.y, Config.spawn.spawnheli.position.z, Config.spawn.spawnheli.position.h, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        local plaque = "LSPD"..math.random(1,9)
        SetVehicleNumberPlateText(vehicle, plaque) 
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
        SetVehicleMaxMods(vehicle)
        SetVehicleLivery(vehicle, 0)
        SetVehicleExtra(vehicle, -1, false)
  end
  
  
  positionheli = {
    {
        Zones = "Zones1",
        x = 448.69, y = -981.65, z = 43.69
    },
}



local interval = 1000
InZone = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        for k,v in pairs(position)do 
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, positionheli[k].x, positionheli[k].y, positionheli[k].z)
                if distance <= 7.0  then
                    interval = 0
                    InZone[v.Zones] = true
                    DrawMarker(20, positionheli[k].x, positionheli[k].y, positionheli[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                else
                    if InZone[v.Zones] then
                        interval = 1000
                        InZone[v.Zones] = false
                    end
                end
                if distance <= 2.0 then
                    interval = 0
                    InZone[v.Zones] = true 
                    RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour accéder au garage hélicpotère", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        MenuHeli()
                     end
            
                end  
                
            end 
        end
    end
end)
   



function MenuHeli()
    local sMenuHeli = RageUI.CreateMenu("Garage", "Garage du LSPD")
    sMenuHeli:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuHeli, not RageUI.Visible(sMenuHeli))
    while sMenuHeli do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuHeli, true, true,true, function()
  
  
                RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Ranger au garage", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                if dist4 < 4 then
                    DeleteEntity(veh)
                    RageUI.CloseAll()
                end 
            end
        end) 
    
                RageUI.ButtonWithStyle("÷ Véhicule - ~b~ Hélico du LSPD", nil, {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                Citizen.Wait(0)  
                spawnuniHeli("polmav")
                RageUI.CloseAll()
                end
            end)
                
                    end, function()
                    end)
        if not RageUI.Visible(sMenuHeli) then
            sMenuHeli = RMenu:DeleteType("Armurerie", true)
        end
    end
end

  





pos = {
    {
    Zones = 'Zone1',
    x = 437.44, y = -975.79, z = 25.7 },
    {
    Zones = 'Zone2',
    x = 433.44, y = -975.79, z = 25.7 },
    {
    Zones = 'Zone3',
    x = 462.40, y = -1019.7, z = 28.104 },
    {
    Zones = 'Zone4',
    x = 469.12, y = -1024.52, z = 28.20 },
    {
    Zones = 'Zone5',
    x = 1865.48, y = 3700.40, z = 33.14},
    {
    Zones = 'Zone6',
    x = 455.84, y = -1024.35, z = 28.45 },
    {
    Zones = 'Zone7',
    x = 447.45, y = -975.95, z = 25.7 },
    {
    Zones = 'Zone8',
    x = 451.8, y = -975.95, z = 25.7 },
    {
    Zones = 'Zone9',
    x = 1891.93, y = 3705.21, z = 32.84 }
}




Citizen.CreateThread(function()
    while true do
        local Timer = 500
        for k,v in pairs(pos)do 
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, pos[k].x, pos[k].y, pos[k].z)
            if distance <= 15.0  then
                Timer = 0
                DrawMarker(21, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false);
                end
               
                end 
            end
        Citizen.Wait(Timer)
    end
end)


AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)
  


    if part == 'VehicleDeleter' then

        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        if IsPedInAnyVehicle(playerPed,  false) then

            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if DoesEntityExist(vehicle) then
                CurrentAction     = 'delete_vehicle'
                CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule'
                CurrentActionData = {vehicle = vehicle}
            end

        end
        
    elseif part == 'VehicleRepair' then
      local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        if IsPedInAnyVehicle(playerPed,  false) then

            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if DoesEntityExist(vehicle) then
                CurrentAction     = 'repair_vehicle'
                CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour réparer votre véhicule'
                CurrentActionData = {vehicle = vehicle}
            end

        end
   

    end

end)





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == 'police' then 
            local playerPed      = PlayerPedId()
            local coords         = GetEntityCoords(playerPed)
            local isInMarker     = false
            local currentStation = nil
            local currentPart    = nil
            local currentPartNum = nil
            for k,v in pairs(Config.PoliceStations) do
                for i=1, #v.VehicleDeleters, 1 do
                    if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, true) < 2 then
                        isInMarker     = true
                        currentStation = k
                        currentPart    = 'VehicleDeleter'
                        currentPartNum = i
                    end
                end
                -- Repair Zone 
                for i=1, #v.VehicleRepair, 1 do
                    if GetDistanceBetweenCoords(coords, v.VehicleRepair[i].x, v.VehicleRepair[i].y, v.VehicleRepair[i].z, true) <2 then
                        isInMarker     = true
                        currentStation = k
                        currentPart    = 'VehicleRepair'
                        currentPartNum = i
                    end
                end
            end

            local hasExited = false

            if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

                if
                    (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
                    (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
                then
                    TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
                    hasExited = true
                end

                HasAlreadyEnteredMarker = true
                LastStation             = currentStation
                LastPart                = currentPart
                LastPartNum             = currentPartNum

                TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
            end

            if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
            end

        else
            Citizen.Wait(0)
        end

    end
end)
AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

Citizen.CreateThread(function()
    while true do


        
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)
            if IsControlJustReleased(0, 38) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
                if CurrentAction == 'delete_vehicle' then
                    if Config.EnableSocietyOwnedVehicles then
                          print(engineHealth)
                          if engineHealth < 1000 then
                              ESX.ShowNotification('~r~Vous devez réparer votre véhicule avant de le ranger')
                          else
                        local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
                        TriggerServerEvent('esx_society:putVehiclelikeInGarage', 'police', vehicleProps)
                          end
                    end
                    local engineHealth  = GetVehicleEngineHealth(CurrentActionData.vehicle)
                    if engineHealth < 1000 then
                      ESX.ShowNotification('~r~Vous devez réparer le véhicule avant de pouvoir le ranger')
                    else 
                    ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
                    TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
                    end
                  elseif CurrentAction == 'repair_vehicle' then
                      RepareAvecPNJ(CurrentActionData.vehicle)
            
                elseif CurrentAction == 'remove_entity' then
                    DeleteEntity(CurrentActionData.entity)
                end
                CurrentAction = nil
            end
        end -- CurrentAction end
    end
end)

function RepareAvecPNJ(target)
	Citizen.CreateThread(function()
		SetVehicleUndriveable(target, true)
        SetVehicleDoorOpen(target, 4, false, false)
        Citizen.Wait(0)
        SetVehicleDoorShut(target, 4, 0)
        SetVehicleFixed(target)
        SetVehicleDeformationFixed(target)
        SetVehicleUndriveable(target, false)
    end)
end