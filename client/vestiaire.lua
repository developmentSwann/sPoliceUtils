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


giletchoisi = {
    gilet1 = 1,
    gilet2 = 1,

}

local playerPed = GetPlayerPed(-1)





function MenuRecruit()
    local playerPed = GetPlayerPed(-1)
local sMenuRecruit = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuRecruit:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuRecruit, not RageUI.Visible(sMenuRecruit))
    while sMenuRecruit do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuRecruit, true, true,true, function()
        
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
            
           
        if not RageUI.Visible(sMenuRecruit) then
           sMenuRecruit = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end



function MenuGilet()
        local playerPed = GetPlayerPed(-1)
local sMenuGilet = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
        sMenuGilet:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuGilet, not RageUI.Visible(sMenuGilet))
        while sMenuGilet do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuGilet, true, true,true, function()

            RageUI.Separator("↓ ~b~Tenue - ~y~[Gilets]~s~ ↓")
            RageUI.List("÷ LSPD - Gilets ", selectionuser.gilet1, giletchoisi.gilet1,  nil, { }, true, function(Hovered, Active, Selected, Index)
                giletchoisi.gilet1 = Index  
                if (Active) then 
                    SetPedComponentVariation(GetPlayerPed(-1), 9, giletchoisi.gilet1,giletchoisi.gilet2, 2)
                    
                end
            end)
            RageUI.ButtonWithStyle("÷ LSPD - Variations du gilet", "Pour modifier la couleur de votre gilet", {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    MenuGilet2()
                end
            end)

            RageUI.ButtonWithStyle('÷ LSPD - ~g~ Confirmer ',nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    if IsPedModel(playerPed,1885233650)  then
                        SetPedComponentVariation(GetPlayerPed(-1), 9,giletchoisi.gilet1,gilet2, 2)
                    elseif IsPedModel(playerPed,-1667301416)  then
                        SetPedComponentVariation(GetPlayerPed(-1), 9,giletchoisi.gilet1,gilet2, 2) 
                    end
                    SetPedArmour(playerPed, 100)
                    MenuVest()

                end
            end)

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
if not RageUI.Visible(sMenuGilet) then
    sMenuGilet = RMenu:DeleteType("Vestiaire", true)
    MenuVest()
 end
end
end



    function MenuGilet2()
        local playerPed = GetPlayerPed(-1)
local sMenuGilet2 = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
        sMenuGilet2:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuGilet2, not RageUI.Visible(sMenuGilet2))
        while sMenuGilet2 do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuGilet2, true, true,true, function() 

                    local table = {}
                    
                    for i = 1 , GetNumberOfPedTextureVariations(GetPlayerPed(-1), 1, giletchoisi.gilet1)-1 , 1 do
                        table[i] = i
                
                        RageUI.ButtonWithStyle('Gilets - ~b~Couleur : ~y~ n°'..i, "Couleur des gilets disponibles.", {RightLabel = nil}, true, function(_,a,Selected)
                            if a then
                                gilet2 = i
                                SetPedComponentVariation(PlayerPedId(-1), 9, giletchoisi.gilet1, gilet2, 2)

                            end
                           if (Selected) then 
                            MenuGilet()
                           end  
                
                            end)
                        end
                    end, function()
                    end)
            if not RageUI.Visible(sMenuGilet2) then
               sMenuGilet2 = RMenu:DeleteType("Vestiaire", true)
               MenuGilet()
            end
        end
    end

function MenuOfficier()
    local playerPed = GetPlayerPed(-1)
local sMenuOfficier = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuOfficier:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuOfficier, not RageUI.Visible(sMenuOfficier))
    while sMenuOfficier do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuOfficier, true, true,true, function()
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
        if not RageUI.Visible(sMenuOfficier) then
           sMenuOfficier = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end

function MenuSergent()
    local playerPed = GetPlayerPed(-1)
local sMenuSergeant = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuSergeant:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuSergeant, not RageUI.Visible(sMenuSergeant))
    while sMenuSergeant do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuSergeant, true, true,true, function()
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
        if not RageUI.Visible(sMenuSergeant) then
           sMenuSergeant = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end



function MenuSergeantChef()
    local playerPed = GetPlayerPed(-1)
local sMenuSergeantC = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuSergeantC:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuSergeantC, not RageUI.Visible(sMenuSergeantC))
    while sMenuSergeantC do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuSergeantC, true, true,true, function()
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
        if not RageUI.Visible(sMenuSergeantC) then
           sMenuSergeantC = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end



function MenuLieutenan()
    local playerPed = GetPlayerPed(-1)
local sMenuLieutenant = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuLieutenant:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuLieutenant, not RageUI.Visible(sMenuLieutenant))
    while sMenuLieutenant do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuLieutenant, true, true,true, function()
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
        if not RageUI.Visible(sMenuLieutenant) then
           sMenuLieutenant = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end


function MenuCapitaine()
    local playerPed = GetPlayerPed(-1)
local sMenuCaptain = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuCaptain:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuCaptain, not RageUI.Visible(sMenuCaptain))
    while sMenuCaptain do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuCaptain, true, true,true, function()
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
        if not RageUI.Visible(sMenuCaptain) then
           sMenuCaptain = RMenu:DeleteType("Vestiaire", true)

           MenuVest()
        end
    end
end






function MenuComandant()
    local playerPed = GetPlayerPed(-1)
local sMenuCommandant = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuCommandant:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuCommandant, not RageUI.Visible(sMenuCommandant))
    while sMenuCommandant do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuCommandant, true, true,true, function()
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
        if not RageUI.Visible(sMenuCommandant) then
           sMenuCommandant = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end






function MenuHenry()
    local playerPed = GetPlayerPed(-1)
local sMenuHenry = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuHenry:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuHenry, not RageUI.Visible(sMenuHenry))
    while sMenuHenry do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuHenry, true, true,true, function()
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
        if not RageUI.Visible(sMenuHenry) then
           sMenuHenry = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end



function MenuMary()
    local playerPed = GetPlayerPed(-1)
local sMenuMary = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuMary:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuMary, not RageUI.Visible(sMenuMary))
    while sMenuMary do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuMary, true, true,true, function()
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
        if not RageUI.Visible(sMenuMary) then
           sMenuMary = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end






function MenuInter()
    local playerPed = GetPlayerPed(-1)
local sMenuInter = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuInter:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuInter, not RageUI.Visible(sMenuInter))
    while sMenuInter do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuInter, true, true,true, function()
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
        if not RageUI.Visible(sMenuInter) then
           sMenuInter = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end



function MenuCeremonie()
    local playerPed = GetPlayerPed(-1)
local sMenuCeremonie = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
    sMenuCeremonie:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuCeremonie, not RageUI.Visible(sMenuCeremonie))
    while sMenuCeremonie do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuCeremonie, true, true,true, function()
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
        if not RageUI.Visible(sMenuCeremonie) then
           sMenuCeremonie = RMenu:DeleteType("Vestiaire", true)
           MenuVest()
        end
    end
end

function MenuVest()
    local playerPed = GetPlayerPed(-1)
local sMenuVests = RageUI.CreateMenu("Vestiaire", "Vestiaire du LSPD")
    sMenuVests:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuVests, not RageUI.Visible(sMenuVests))
    while sMenuVests do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuVests, true, true,true, function()
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
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuRecruit()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if  ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuOfficier()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'intendent'  or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuSergent()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end

            if  ESX.PlayerData.job.grade_name == 'intendent' or  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuSergeantChef()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",nil, {RightLabel = "→"},true,function(Hovered, Active, Selected)
                    if Selected then
                        MenuLieutenan()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end





            if  ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuCapitaine()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end


            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuComandant()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end

            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Gilets]", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuGilet()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Gilets]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            RageUI.Separator("↓ ~b~Tenues - ~g~[Spécifiques]~s~ ↓")
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Henry]", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuHenry()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Henry]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Mary]", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuMary()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Mary]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Intervention]", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuInter()
                    end
               
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Intervention]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Cérémonie]", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        MenuCeremonie()
                    end
             end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~g~[Cérémonie]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

        
        end, function()
        end)

        if not RageUI.Visible(sMenuVests) then
           sMenuVests = RMenu:DeleteType("Vestiaire", true)
        end
    end
end
---------------------------------------------




position = {
    {
        Zones = "Zones1",
        x =463.52, y= -998.97, z= 30.68
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
                local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, position[k].x, position[k].y, position[k].z)
                if distance <= 7.0  then
                    interval = 0
                    InZone[v.Zones] = true
                    DrawMarker(20, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                else
                    if InZone[v.Zones] then
                        interval = 1000
                        InZone[v.Zones] = false
                    end
                end
                if distance <= 2.0 then
                    interval = 0
                    InZone[v.Zones] = true 
                    RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour accéder au vestiaire", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        MenuVest()
                     end
           
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