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

RMenu.Add('ammo', 'main', RageUI.CreateMenu("Vestaire", "Armurerie du LSPD"))
RMenu:Get('ammo', 'main'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'arme', RageUI.CreateSubMenu(RMenu:Get('ammo', 'main'), "Armurerie", "Armes du LSPD"))
RMenu:Get('ammo', 'arme'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'accessoires', RageUI.CreateSubMenu(RMenu:Get('ammo', 'main'), "Armurerie", "Accessoires du LSPD"))
RMenu:Get('ammo', 'accessoires'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'cadet', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie cadet"))
RMenu:Get('ammo', 'cadet'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'officer', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie officier"))
RMenu:Get('ammo', 'officer'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'sergeant', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie Sergent"))
RMenu:Get('ammo', 'sergeant'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'sergeantc', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie commandant"))
RMenu:Get('ammo', 'sergeantc'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'lieutenant', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie Lieutenant"))
RMenu:Get('ammo', 'lieutenant'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'captain', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie capitaine"))
RMenu:Get('ammo', 'captain'):SetRectangleBanner(0, 0, 0, 255)
RMenu.Add('ammo', 'boss', RageUI.CreateSubMenu(RMenu:Get('ammo', 'arme'), "Armurerie", "Armurerie commandant"))
RMenu:Get('ammo', 'boss'):SetRectangleBanner(0, 0, 0, 255)




RMenu:Get('ammo', 'main').Closed = function() end
RMenu:Get('ammo', 'arme').Closed = function() end
RMenu:Get('ammo', 'accessoires').Closed = function() end
local statedefcon = "OFF"
local defcon = false
Citizen.CreateThread(function()
    
   
   
    while true do
        
        RageUI.IsVisible(RMenu:Get('ammo', 'main'), true, true, true, function() 
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Armurerie : ~y~[Armes]", nil, {RightLabel = "→"},true, function()
			end, RMenu:Get('ammo', 'arme'))
          
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Armurerie : ~y~[Accessoires]",nil, {RightLabel = "→"},true, function()
			end, RMenu:Get('ammo', 'accessoires'))
           
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('ammo', 'arme'), true, true, true, function()
            RageUI.Separator('↓ ~r~ Déclarer le DEFCON ↓') 
            if  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                
                
            
            
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ DEFCON : ~g~[" ..statedefcon .."]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        
                        
                      TriggerServerEvent('defcon',defcon)
                       
                      TriggerServerEvent('statedef',statedefcon)
                     
                    end
                    
                end)
                
            else 
                RageUI.ButtonWithStyle("÷LSPD - ~b~ DEFCON : ~g~[" ..statedefcon .."]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                    if (Selected) then
                        
                    end
                end)
            end
            
        

            RageUI.Separator('↓ ~r~ Équipement LSPD ↓')
            if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'or ESX.PlayerData.job.grade_name == 'chef' then
                
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]", nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'cadet'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]", description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)

            end

            if  ESX.PlayerData.job.grade_name == 'intendent' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'officer'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Officier]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'intendent'  or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'sergeant'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end

            if  ESX.PlayerData.job.grade_name == 'intendent' or  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'sergeantc'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'lieutenant'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end





            if  ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'captain'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Capitaine]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end


            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",nil, {RightLabel = "→"},true, function()
				end, RMenu:Get('ammo', 'boss'))
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
           
        end, function()
        end)


--- Cadet
for k,v in pairs (AuthorizedWeapons) do
    RageUI.IsVisible(RMenu:Get('ammo', v.Menu), true, true, true, function()
        for u,j in pairs (v.categorie) do
            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~y~["..j.name.."] ",nil, {RightLabel = "~g~"..j.price.."$"}, true, function(Hovered, Active, Selected)
                if Selected then
                    ESX.TriggerServerCallback('swann_mask:verifsous', function(suffisantsous)
                        if suffisantsous then
                            TriggerServerEvent('ammu',j.cat, j.munitions)
                        TriggerServerEvent('buy', j.price)
                        else
                            ESX.ShowAdvancedNotification('÷ LSPD', 'Armurerie','Tu n\'as pas assez d\'argent!' , "char_greed", 1)
                        end
                    end, j.price) 
                end
            end)
        
        end
        
    if #v.defcon ~= 0 then
            RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
            if defcon then
                for l,m in pairs(v.defcon) do
                    RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~y~["..m.name.."] ",nil, {RightLabel = "~g~"..m.price.."$"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ESX.TriggerServerCallback('swann_mask:verifsous', function(suffisantsous)
                                if suffisantsous then
                                    TriggerServerEvent('ammu',m.cat, m.munitions)
                                TriggerServerEvent('buy', m.price)
                                else
                                    ESX.ShowAdvancedNotification('÷ LSPD', 'Armurerie','Tu n\'as pas assez d\'argent!' , "char_greed", 1)
                                end
                            end, m.price) 
                            
                        end
                        
                    end)
                end
            elseif #v.defcon == 1 then
                RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                    if (Selected) then
                        
                    end
                end)
            elseif #v.defcon == 2 then
                    RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                        if (Selected) then
                            
                        end
                    end)
                    RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                        if (Selected) then
                            
                        end
                    end)
            end
        end  
    end, function()
    end)
end


    RageUI.IsVisible(RMenu:Get('ammo', 'accessoires'), true, true, true, function() 
        for k,v in pairs (AuthorizedAccess.categorie) do
        RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~["..v.name.."]", nil, {RightLabel = "~g~"..v.price.."$"},true, function(Hovered, Active, Selected)
        if Selected then
            ESX.TriggerServerCallback('swann_mask:verifsous', function(suffisantsous)
                if suffisantsous then
                    TriggerServerEvent('access', v.cat, 1,v.max)
                    TriggerServerEvent('buy', v.price)
                else
                    ESX.ShowAdvancedNotification('÷ LSPD', 'Armurerie','Tu n\'as pas assez d\'argent!' , "char_greed", 1)
                end
            end, v.price) 
        end
        end)
    end
    end, function()
    end)


     
		Citizen.Wait(0)
	end
end)

---------------------------------------------




posammu = {
    {
        Zones = "Zones1",
        x = 482.72 ,y= -995.83, z=30.68
    },
}

inZone = {}
local interval = 1000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        for k,v in pairs(posammu)do 
            local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, posammu[k].x, posammu[k].y, posammu[k].z)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == 'police' then
                if distance <= 18 then
                    DrawMarker(20, posammu[k].x, posammu[k].y, posammu[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
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
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder à l'armurerie")        
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('ammo', 'main'), not RageUI.Visible(RMenu:Get('ammo', 'main')))
                    end

                else 
                    if inZone[v.Zones] then 
                        interval = 1000
                        inZone[v.Zones] = false
                    end
                end
            end
        end
        
    end
end)



RegisterNetEvent('defconclient')
AddEventHandler('defconclient', function(def)
    
    defcon=def
    
end)

RegisterNetEvent('stateclient')
AddEventHandler('stateclient', function(state)
    
    statedefcon=state
    
end)


AuthorizedWeapons = {
    recruit = { 
        grade = 'Cadet', Menu = 'cadet' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0}, 
        },
        defcon = {
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 }
        }
    },

    officer = { 
        grade = 'Officier', Menu = 'officer' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0},
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 },
        },
        defcon = {
            {cat = 'weapon_assaultsmg', price = 35000 , name = 'SMG', munitions = 300 },
        }
    },


    sergeant = { 
        grade = 'Sergent', Menu = 'sergeant' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0},
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 },
            {cat = 'weapon_assaultsmg', price = 35000 , name = 'SMG', munitions = 300 },
        },
        defcon = {
            {cat = 'weapon_bullpuprifle', price = 50000 , name = 'Bullpup', munitions = 300 },
            {cat = 'weapon_specialcarbine', price = 50000 , name = 'Fusil spécial', munitions = 300 },
        }
    },

    sergeantc = { 
        grade = 'Sergent-Chef', Menu = 'sergeantc' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0},
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 },
            {cat = 'weapon_assaultsmg', price = 35000 , name = 'SMG', munitions = 300 },
        },
        defcon = {
            {cat = 'weapon_bullpuprifle', price = 50000 , name = 'Bullpup', munitions = 300 },
            {cat = 'weapon_specialcarbine', price = 50000 , name = 'Fusil spécial', munitions = 300 },
        }
    },

    lieutenant = { 
        grade = 'Lieutenant', Menu = 'lieutenant' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0},
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 },
            {cat = 'weapon_assaultsmg', price = 35000 , name = 'SMG', munitions = 300 },
            {cat = 'weapon_bullpuprifle', price = 50000 , name = 'Bullpup', munitions = 300 },
            {cat = 'weapon_specialcarbine', price = 50000 , name = 'Fusil spécial', munitions = 300 },
        },
        defcon = {}
    },

    captain = { 
        grade = 'Capitaine', Menu = 'captain' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0},
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 },
            {cat = 'weapon_assaultsmg', price = 35000 , name = 'SMG', munitions = 300 },
            {cat = 'weapon_bullpuprifle', price = 50000 , name = 'Bullpup', munitions = 300 },
            {cat = 'weapon_specialcarbine', price = 50000 , name = 'Fusil spécial', munitions = 300 },
            {cat = 'weapon_pumpshotgun', price = 50000 , name = 'Pompe', munitions = 300 },

        },
        defcon = {}
    },

    boss = { 
        grade = 'Commandant', Menu = 'boss' , categorie =  {
            {cat ='WEAPON_NIGHTSTICK', price = 100, name = 'Matraque', munitions = 0},
            {cat= 'weapon_stungun', price = 100, name = 'Tazer', munitions = 0}, 
            {cat ='weapon_flashlight', price = 50, name = 'Lampe', munitions = 0},
            {cat = 'weapon_combatpistol', price = 500 , name = 'Pistolet', munitions = 300 },
            {cat = 'weapon_assaultsmg', price = 35000 , name = 'SMG', munitions = 300 },
            {cat = 'weapon_bullpuprifle', price = 50000 , name = 'Bullpup', munitions = 300 },
            {cat = 'weapon_specialcarbine', price = 50000 , name = 'Fusil spécial', munitions = 300 },
            {cat = 'weapon_pumpshotgun', price = 50000 , name = 'Pompe', munitions = 300 },
        },
        defcon = {}
    },

    

}

AuthorizedAccess = {   
   categorie =  {
            {cat ='clip', price = 30, name = 'Chargeurs', max = 20},
            {cat= 'extendedclip', price = 2000, name = "Grande cap'", max = 10}, 
            {cat ='armorLSPD', price = 3000, name = 'Gilet 1', max = 1},
            {cat ='armorLSPD2', price = 3000, name = 'Gilet 2', max = 1},
            {cat = 'police_cuff', price = 5000 , name = 'Menottes', max = 1 },
            {cat = 'police_key', price = 5000 , name = 'Clés', max = 1 },
            {cat = 'grip', price = 2000 , name = 'Poignée', munitions = 10 },
        },
        
    
}

