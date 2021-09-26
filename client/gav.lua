ESX = nil



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


----------------MARKER--------------------



posGAV = {
    {
        Zones = "Zones1",
        x= 473.06 ,y= -1007.60,z= 26.27
    },
}




local interval = 1000
InZone = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        for k,v in pairs(position)do 
            local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, posGAV[k].x, posGAV[k].y, posGAV[k].z)
            if distance <= 7.0  then
                interval = 0
                InZone[v.Zones] = true
                DrawMarker(20, posGAV[k].x, posGAV[k].y, posGAV[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
            else
                if InZone[v.Zones] then
                        interval = 1000
                        InZone[v.Zones] = false
                 end
            end
            if distance <= 1.0 then
                RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour accéder au vestiaire de GAV", time_display = 1 })
                if IsControlJustPressed(1,51) then           
                    MenuGAV()
                    end
            end  
        end
    end
end)

----------------FONCTIONS--------------------
local tenuGAV = false
function MenuGAV()
    
    local playerPed = GetPlayerPed(-1)
    local sMenuGav = RageUI.CreateMenu("Vestiaire", "Vestiaire des GAV")
    sMenuGav:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuGav, not RageUI.Visible(sMenuGav))
    while sMenuGav do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuGav, true, true,true, function()
            if tenuGAV == true then
                RageUI.Separator("")
                RageUI.Separator("↓ Tenue - ~g~[Civil]~s~ ↓")
                RageUI.Separator("")
                RageUI.ButtonWithStyle("÷ GAV - ~g~Récupérer ses affaires",nil, {nil}, true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                        SetPedPropIndex(GetPlayerPed(-1) , 0, -1, 0)
                        tenuGAV = false
                        end)
                    end
                end)
            else 
                RageUI.Separator("")
                RageUI.Separator("↓ Tenue - ~o~[GAV]~s~ ↓")
                RageUI.Separator("")
                RageUI.ButtonWithStyle("÷ GAV - ~o~S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
                        tenuGAV = true
						if IsPedModel(playerPed,1885233650)  then
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 15, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 5, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 5, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 5, 7) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 0, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 58, 2) --- Chapeau
                            SetPedPropIndex(GetPlayerPed(-1) , 1, 0, 0) 
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0) --- GPB
                            MenuGAV()
						elseif IsPedModel(playerPed,-1667301416)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 8, 15, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 74, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 4, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 66, 6) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 0, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 58, 2) --- Chapeau
                            SetPedPropIndex(GetPlayerPed(-1) , 1, 15, 0) 
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0) --- GPB
                            MenuGAV()
                            
						end
					end
				end)
            end

            end, function()
            end)
            
           
        if not RageUI.Visible(sMenuGav) then
           sMenuGav = RMenu:DeleteType("Vestiaire", true)
        end
    end
end