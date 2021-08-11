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

---------------- FONCTIONS ------------------

RMenu.Add('tenue', 'vpolice', RageUI.CreateMenu("Vestaire", "Vestiaire du LSPD"))
RMenu:Get('tenue', 'vpolice'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'cadet', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire cadet"))
RMenu:Get('tenue', 'cadet'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'officer', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire officier"))
RMenu:Get('tenue', 'officer'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'sergeant', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire Sergent"))
RMenu:Get('tenue', 'sergeant'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'sergeantc', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire commandant"))
RMenu:Get('tenue', 'sergeantc'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'lieutenant', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire Lieutenant"))
RMenu:Get('tenue', 'lieutenant'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'captain', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire capitaine"))
RMenu:Get('tenue', 'captain'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'boss', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire commandant"))
RMenu:Get('tenue', 'boss'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'mary', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire commandant"))
RMenu:Get('tenue', 'mary'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'henry', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire commandant"))
RMenu:Get('tenue', 'henry'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'inter', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire commandant"))
RMenu:Get('tenue', 'inter'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'ceremonie', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire commandant"))
RMenu:Get('tenue', 'ceremonie'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'gilet', RageUI.CreateSubMenu(RMenu:Get('tenue', 'vpolice'), "Vestiaire", "Vestiaire Gilets"))
RMenu:Get('tenue', 'gilet'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('tenue', 'color', RageUI.CreateSubMenu(RMenu:Get('tenue', 'gilet'), "Vestiaire", "Vestiaire Gilets"))
RMenu:Get('tenue', 'color'):SetRectangleBanner(0, 0, 0, 255)
RMenu:Get('tenue', 'color').Closed = function()
giletchoisi.gilet1 = 1 
giletchoisi.gilet2 = 1
end
RMenu:Get('tenue', 'vpolice').Closed = function() end
RMenu:Get('tenue', 'cadet').Closed = function() end
RMenu:Get('tenue', 'officer').Closed = function() end
RMenu:Get('tenue', 'sergeant').Closed = function() end
RMenu:Get('tenue', 'lieutenant').Closed = function() end
RMenu:Get('tenue', 'captain').Closed = function() end
RMenu:Get('tenue', 'boss').Closed = function() end
giletchoisi = {
    gilet1 = 1,
    gilet2 = 1,

}
Citizen.CreateThread(function()
    while true do
        playerPed = GetPlayerPed(-1)
        RageUI.IsVisible(RMenu:Get('tenue', 'vpolice'), true, true, true, function()

            RageUI.ButtonWithStyle("~r~ Reprendre sa tenue civil",nil, {nil}, true, function(Hovered, Active, Selected)
                if Selected then
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    SetPedPropIndex(GetPlayerPed(-1) , 0, -1, 0)
                    end)
                end
            end)
            RageUI.Separator("↓ ~b~Tenues - ~y~[LSPD]~s~ ↓")

            
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]", nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'cadet'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if  ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'officer'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'intendent'  or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'sergeant'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end

            if  ESX.PlayerData.job.grade_name == 'intendent' or  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'sergeantc'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'lieutenant'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end





            if  ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'captain'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end


            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'boss'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end

            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Gilets]", nil, {RightLabel = "→"},true, function()
                end, RMenu:Get('tenue', 'gilet'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Gilets]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            RageUI.Separator("↓ ~b~Tenues - ~g~[Spécifiques]~s~ ↓")
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Henry]", nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'henry'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Henry]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Mary]", nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'mary'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Mary]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Intervention]", nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'inter'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Intervention]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Cérémonie]", nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('tenue', 'ceremonie'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Cérémonie]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

        
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('tenue','cadet'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenue - ~y~[Cadet]~s~ ↓")
            RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedModel(playerPed,1885233650) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 53, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 93, 2)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 30, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 6, 20, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 63, 9) --- Chapeau
                        elseif IsPedModel(playerPed,-1667301416) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
                        end
                    end
            	end)	
                RageUI.Separator("↓ ~b~Gilet - ~y~[Cadet]~s~ ↓")
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedModel(playerPed,1885233650) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 4, 4) --tshirt 
                            SetPedArmour(playerPed, 100)
                        elseif IsPedModel(playerPed,-1667301416) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3) --tshirt
                            SetPedArmour(playerPed, 100) 
                            
                        end
                    end
                end)
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedModel(playerPed,1885233650) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0) --tshirt
                            SetPedArmour(playerPed, 0) 
                            
                        elseif IsPedModel(playerPed,-1667301416) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                            SetPedArmour(playerPed, 0) --tshirt 
                        
                        end
                    end
                end)
		end, function()
	    end)
        
        RageUI.IsVisible(RMenu:Get('tenue','gilet'), true, true, true, function()
                RageUI.Separator("↓ ~b~Tenue - ~y~[Gilets]~s~ ↓")
                
                
                RageUI.List("÷ LSPD - Gilets ", selectionuser.gilet1, giletchoisi.gilet1,  nil, { }, true, function(Hovered, Active, Selected, Index)
                    giletchoisi.gilet1 = Index
                    
                    if (Active) then 
                        SetPedComponentVariation(GetPlayerPed(-1), 9, giletchoisi.gilet1,giletchoisi.gilet2, 2)
                        
                    end
                end)
                RageUI.ButtonWithStyle("÷ LSPD - Variations du gilet", "Pour modifier la couleur de votre gilet", {RightLabel = "→→"},true, function()
                end, RMenu:Get('tenue', 'color'))

                    RageUI.ButtonWithStyle('÷ LSPD - ~g~ Confirmer ',nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            if IsPedModel(playerPed,1885233650)  then
                                SetPedComponentVariation(GetPlayerPed(-1), 9,giletchoisi.gilet1,gilet2, 2)
                            elseif IsPedModel(playerPed,-1667301416)  then
                                SetPedComponentVariation(GetPlayerPed(-1), 9,giletchoisi.gilet1,gilet2, 2) 
                            end
                            SetPedArmour(playerPed, 100)
                        end
                    end, RMenu:Get('tenue', 'vpolice'))

                    RageUI.ButtonWithStyle('÷ LSPD - ~r~ Retirer le gilet', "Pour retirer votre gilet", {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                        if Selected then
                            if IsPedModel(playerPed,1885233650)  then
                                SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0)
                            elseif IsPedModel(playerPed,-1667301416)  then
                                SetPedComponentVariation(GetPlayerPed(-1), 9,0,0)
                            end
                            SetPedArmour(playerPed, 0)
                        end
                    end)
                
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('tenue', 'color'), true, true, true, function() 
    
                local table = {}
                
                for i = 1 , GetNumberOfPedTextureVariations(GetPlayerPed(-1), 1, giletchoisi.gilet1)-1 , 1 do
                    table[i] = i
    
    
                    
    
    
                    RageUI.ButtonWithStyle('Gilets - ~b~Couleur : ~y~ n°'..i, "Couleur des gilets disponibles.", {RightLabel = nil}, true, function(_,a,Selected)
                        if a then
                            gilet2 = i
                            SetPedComponentVariation(PlayerPedId(-1), 9, giletchoisi.gilet1, gilet2, 2)
                        end
                       if (Selected) then 
                        
                       end  
    
                        end, RMenu:Get('tenue', 'gilet'))
                    end
                end, function()
                end)
    
            
        RageUI.IsVisible(RMenu:Get('tenue','officer'), true, true, true, function()
            RageUI.Separator("↓ ~b~Tenue - ~y~[Officier]~s~ ↓")
            if  ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedModel(playerPed,1885233650) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 56, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 101, 2)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 24, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 1, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, 20, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 63, 9) --- Chapeau
                        elseif IsPedModel(playerPed,-1667301416)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badg
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
                        end
                    end
                end)
            else 
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end

            


            RageUI.Separator("↓ ~b~Gilet - ~y~[Officier]~s~ ↓")
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 12, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
                                        
                    elseif IsPedModel(playerPed,-1667301416) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt          
                    end
                end
            end)
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                                    
                    elseif IsPedModel(playerPed,-1667301416) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                                
                    end
                end
            end)
       	 	end, function()
    	end)



    	RageUI.IsVisible(RMenu:Get('tenue','sergeant'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenues - ~y~[Sergent]~s~ ↓")
            if  ESX.PlayerData.job.grade_name == 'intendent'  or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 42, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 101, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 24, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 2, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 58, 2) --- Chapeau
						elseif IsPedModel(playerPed,-1667301416) then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
						end
					end
				end)
			else 
				RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
					if (Selected) then
					end
				end)
			end


			RageUI.Separator("↓ ~b~Gilet - ~y~[Sergent]~s~ ↓")
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 12, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
					
					end
				end
			end)
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                                    
                    elseif IsPedModel(playerPed,-1667301416) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                                
                    end
                end
            end)

            

		end, function()
		end)

        RageUI.IsVisible(RMenu:Get('tenue','sergeantc'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenues - ~y~[Sergent-Chef]~s~ ↓")
            if  ESX.PlayerData.job.grade_name == 'intendent' or  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 49, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 101, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 24, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 7, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 58, 2) --- Chapeau   --shoes
						elseif IsPedModel(playerPed,-1667301416) then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
						end
					end
				end)
			else 
				RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
					if (Selected) then
					end
				end)
			end


			RageUI.Separator("↓ ~b~Gilet - ~y~[Sergent-Chef]~s~ ↓")
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 12, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
					
					end
				end
			end)
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                                    
                    elseif IsPedModel(playerPed,-1667301416) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                                
                    end
                end
            end)

            

		end, function()
		end)

		RageUI.IsVisible(RMenu:Get('tenue','lieutenant'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenue - ~y~[Lieutenant]~s~ ↓")
            if  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 130, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 322, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 20, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 28, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 7, 1) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, -1, 0) --- Chapeau   
						elseif IsPedModel(playerPed,-1667301416) then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau 
						end
					end
				end)
			else 
				RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
					if (Selected) then
					end
				end)
			end



			RageUI.Separator("↓ ~b~Gilet - ~y~[Lieutenant]~s~ ↓")
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 12, 0)
                        SetPedArmour(playerPed, 100) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
					
					end
				end
			end)
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
					
					end
				end
			end)
				
		end, function()
		end)


		RageUI.IsVisible(RMenu:Get('tenue','captain'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenue - ~y~[Capitaine]~s~ ↓")
			if   ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 130, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 322, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 20, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 28, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 7, 1) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, -1, 0) --- Chapeau 
						elseif IsPedModel(playerPed,-1667301416)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
						end
					end
				end)
			else 
				RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
					if (Selected) then
					end
				end)
			end

			RageUI.Separator("↓ ~b~Gilet - ~y~[Capitaine]~s~ ↓")
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 16, 0)
                        SetPedArmour(playerPed, 100) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
					
					end
				end
			end)
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
					
					end
				end
			end)
			
		end, function()
		end)
        
       


		RageUI.IsVisible(RMenu:Get('tenue','boss'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenue - ~y~[Commandant]~s~ ↓")
			if  ESX.PlayerData.job.grade_name == 'boss' then
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 28,2) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 328, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 22, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 143, 0) --- Chapeau
						elseif IsPedModel(playerPed,-1667301416)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
						end
					end
				end)
			else 
				RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
					if (Selected) then
					end
				end)
			end

			RageUI.Separator("↓ ~b~Gilet - ~y~[Commandant]~s~ ↓")
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 12, 0)
                        SetPedArmour(playerPed, 100) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
					
					end
				end
			end)
       
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
					
					end
				end
			end)
        end, function()
		end)

        

           

                RageUI.IsVisible(RMenu:Get('tenue','henry'), true, true, true, function()
                    RageUI.Separator("↓ ~b~Tenue - ~g~[Henry]~s~ ↓")
                        RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                if IsPedModel(playerPed,1885233650)  then
                                    SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                                    SetPedComponentVariation(GetPlayerPed(-1) , 8, 28,2) --tshirt 
                                    SetPedComponentVariation(GetPlayerPed(-1) , 11, 139, 3)  --torse
                                    SetPedComponentVariation(GetPlayerPed(-1) , 3, 22, 0)  -- bras
                                    SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                                    SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                                    SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                                    SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                                    SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                                    SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                                    SetPedPropIndex(GetPlayerPed(-1) , 0, 115, 0) --- Chapeau
                                elseif IsPedModel(playerPed,-1667301416)  then
                                    SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
                                end
                            end
                        end)
                    
        
                    RageUI.Separator("↓ ~b~Gilet - ~g~[Henry]~s~ ↓")
                    RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            if IsPedModel(playerPed,1885233650) then
                                SetPedComponentVariation(GetPlayerPed(-1) , 9, 27, 5)
                                SetPedArmour(playerPed, 100) --tshirt 
                                
                            elseif IsPedModel(playerPed,-1667301416) then
                                SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                                SetPedArmour(playerPed, 100) --tshirt 
                            
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            if IsPedModel(playerPed,1885233650) then
                                SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                                SetPedArmour(playerPed, 0) --tshirt 
                                
                            elseif IsPedModel(playerPed,-1667301416) then
                                SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                                SetPedArmour(playerPed, 0) --tshirt 
                            
                            end
                        end
                    end)
                end, function()
                end)

            RageUI.IsVisible(RMenu:Get('tenue','mary'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenue - ~g~[Mary]~s~ ↓")
			
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 28,0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 219, 2)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 24, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 52, 0) --- Chapeau
						elseif IsPedModel(playerPed,-1667301416)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
						end
					end
				end)
			

			RageUI.Separator("↓ ~b~Gilet - ~g~[Mary]~s~ ↓")
			RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 12, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                        SetPedArmour(playerPed, 100) --tshirt 
					
					end
				end
			end)
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
				if Selected then
					if IsPedModel(playerPed,1885233650) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
						
					elseif IsPedModel(playerPed,-1667301416) then
						SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
					
					end
				end
			end)
        end, function()
		end)


            RageUI.IsVisible(RMenu:Get('tenue','inter'), true, true, true, function()
                RageUI.Separator("↓ ~b~Tenue - ~g~[Intervention]~s~ ↓")
                
                    RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            if IsPedModel(playerPed,1885233650)  then
                                SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                                SetPedComponentVariation(GetPlayerPed(-1) , 8, 28,2) --tshirt 
                                SetPedComponentVariation(GetPlayerPed(-1) , 11, 328, 0)  --torse
                                SetPedComponentVariation(GetPlayerPed(-1) , 3, 22, 0)  -- bras
                                SetPedComponentVariation(GetPlayerPed(-1) , 4, 52, 1) --- pantalon
                                SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                                SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                                SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- Sac
                                SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                                SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                                SetPedPropIndex(GetPlayerPed(-1) , 0, 119, 0) --- Chapeau
                            elseif IsPedModel(playerPed,-1667301416)  then
                                SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                                SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                                SetPedComponentVariation(GetPlayerPed(-1) , 11, 103, 3)  --torse
                                SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                                SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                                SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0)  --- Chaine
                                SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                                SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                                SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                                
                                SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
                            end
                        end
                    end)
                
    
                RageUI.Separator("↓ ~b~Gilet - ~g~[Intervention]~s~ ↓")
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedModel(playerPed,1885233650) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 16, 0)
                            SetPedArmour(playerPed, 100) --tshirt 
                            
                        elseif IsPedModel(playerPed,-1667301416) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 11, 3)
                            SetPedArmour(playerPed, 100) --tshirt 
                        
                        end
                    end
                end)
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedModel(playerPed,1885233650) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                            SetPedArmour(playerPed, 0) --tshirt 
                            
                        elseif IsPedModel(playerPed,-1667301416) then
                            SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                            SetPedArmour(playerPed, 0) --tshirt 
                        
                        end
                    end
                end)
                

		end, function()
		end)

        RageUI.IsVisible(RMenu:Get('tenue','ceremonie'), true, true, true, function()
			RageUI.Separator("↓ ~b~Tenue - ~g~[Cérémonie]~s~ ↓")
			
				RageUI.ButtonWithStyle("÷ LSPD -~b~ S'habiller ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
					if Selected then
						if IsPedModel(playerPed,1885233650)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                                SetPedComponentVariation(GetPlayerPed(-1) , 8, 28,2) --tshirt 
                                SetPedComponentVariation(GetPlayerPed(-1) , 11, 349, 0)  --torse
                                SetPedComponentVariation(GetPlayerPed(-1) , 3, 80, 0)  -- bras
                                SetPedComponentVariation(GetPlayerPed(-1) , 4, 28, 1) --- pantalon
                                SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                                SetPedComponentVariation(GetPlayerPed(-1) , 6, 10, 0) -- chaussures
                                SetPedComponentVariation(GetPlayerPed(-1) , 5, 0, 0) --- Sac
                                SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                                SetPedPropIndex(GetPlayerPed(-1) , 6, -1, 0) --- Montre
                                SetPedPropIndex(GetPlayerPed(-1) , 0, -1, 0) --- Chapeau
						elseif IsPedModel(playerPed,-1667301416)  then
							SetPedComponentVariation(GetPlayerPed(-1) , 5, 81, 0) --- sac
                            SetPedComponentVariation(GetPlayerPed(-1) , 8, 152, 0) --tshirt 
                            SetPedComponentVariation(GetPlayerPed(-1) , 11, 92, 0)  --torse
                            SetPedComponentVariation(GetPlayerPed(-1) , 3, 40, 0)  -- bras
                            SetPedComponentVariation(GetPlayerPed(-1) , 4, 61, 0) --- pantalon
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 0, 0)  --- Chaine
                            SetPedComponentVariation(GetPlayerPed(-1) , 6, 24, 0) -- chaussures
                            SetPedComponentVariation(GetPlayerPed(-1) , 7, 1, 0) -- (Chaine)
                            SetPedComponentVariation(GetPlayerPed(-1) , 10, 0, 0) --- Badge
                            
                            SetPedPropIndex(GetPlayerPed(-1) , 0, 141, 0) --- Chapeau
						end
					end
				end)
		
            RageUI.Separator("↓ ~b~Gilet - ~g~[Cérémonie]~s~ ↓")
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enfiler ",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 31, 0)
                        SetPedArmour(playerPed, 100) --tshirt 
                        
                    elseif IsPedModel(playerPed,-1667301416) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 122, 0)
                        SetPedArmour(playerPed, 100) --tshirt 
                    
                    end
                end
            end)
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Enlever",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                        
                    elseif IsPedModel(playerPed,-1667301416) then
                        SetPedComponentVariation(GetPlayerPed(-1) , 9, 0, 0)
                        SetPedArmour(playerPed, 0) --tshirt 
                    
                    end
                end
            end)
			
        end, function()
		end)
     
		Citizen.Wait(0)
	end
end)

---------------------------------------------




position = {
    {
        Zones = "Zones1",
        x =463.52, y= -998.97, z= 30.68
    },
}

inZone = {}
local interval = 1000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        for k,v in pairs(position)do 
            local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, position[k].x, position[k].y, position[k].z)
            if distance <= 18 then
                DrawMarker(20, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                interval = 0
            else
                if inZone[v.Zones] then 
                    interval = 1000
                    inZone[v.Zones] = false
                end
                
            end
            if distance <= 1.2 then
                interval = 0
                inZone[v.Zones]= true
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au vestiaire")        
                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('tenue', 'vpolice'), not RageUI.Visible(RMenu:Get('tenue', 'vpolice')))
                end

            else 
                if inZone[v.Zones] then 
                    interval = 1000
                    inZone[v.Zones] = false
                end
            end
        end
        
    end
end)


maxgilet = {
    gilet1 = 30,
    gilet2= 12
    
}

selectionuser = {
    gilet1 = {},
    gilet2 = {},
    
}



Citizen.CreateThread(function()
    for k in pairs(maxgilet) do
        for k in pairs(selectionuser) do
    for i = 1, maxgilet[k] do
        table.insert(selectionuser[k], i)
        
    end
end
end
end)