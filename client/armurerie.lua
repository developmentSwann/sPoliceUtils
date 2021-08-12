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

local statedefcon = "OFF"
local defcon = false


function MenuAmmu()
    local sMenuAmmu = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
    sMenuAmmu:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuAmmu, not RageUI.Visible(sMenuAmmu))
    while sMenuAmmu do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuAmmu, true, true,true, function()
            
            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Armurerie : ~y~[Armes]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    MenuArme()
                end
            end)


            RageUI.ButtonWithStyle("÷ LSPD - ~b~ Armurerie : ~y~[Accessoires]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    MenuAccess()
                end
            end)
        end, function()
        end)
        if not RageUI.Visible(sMenuAmmu) then
            sMenuAmmu = RMenu:DeleteType("Armurerie", true)
        end
    end
end


function MenuAccess()
    local sMenuAccess = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
    sMenuAccess:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuAccess, not RageUI.Visible(sMenuAccess))
    while sMenuAccess do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuAccess, true, true,true, function()
            
         
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
        if not RageUI.Visible(sMenuAccess) then
           sMenuAccess = RMenu:DeleteType("Armurerie", true)
           MenuAmmu()
        end
    end
end



function MenuArme()
    local sMenuArme = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
    sMenuArme:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuArme, not RageUI.Visible(sMenuArme))
    while sMenuArme do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuArme, true, true,true, function()
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
                
               
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Cadet]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        MenuCadet()
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
                    if (Selected) then
                        MenuOfficer()
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
                    if (Selected) then
                        MenuSergeant()
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
                    if (Selected) then
                        MenuSergeantC()
                    end
                end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Sergent-Chef]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
            


            if  ESX.PlayerData.job.grade_name == 'lieutenant'  or ESX.PlayerData.job.grade_name == 'chef' or ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Lieutenant]",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        MenuLieutenant()
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
                    if (Selected) then
                        MenuCaptain()
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
                    if (Selected) then
                        MenuCommandant()
                    end
                end)
            else
                RageUI.ButtonWithStyle("÷ LSPD - ~b~ Équipement : ~y~[Commandant]",description, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
           
        
        end, function()
        end)
        if not RageUI.Visible(sMenuArme) then
            sMenuArme = RMenu:DeleteType("Armurerie", true)
            MenuAmmu()
        end
    end
end



    function MenuCadet()
        local sMenuCadet = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuCadet:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuCadet, not RageUI.Visible(sMenuCadet))
        while sMenuCadet do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuCadet, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.recruit.categorie) do
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
                    if #AuthorizedWeapons.recruit.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.recruit.defcon) do
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
                        elseif #AuthorizedWeapons.recruit.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.recruit.defcon == 2 then
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
        if not RageUI.Visible(sMenuCadet) then
                sMenuCadet = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end


    function MenuOfficer()
        local sMenuOfficer = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuOfficer:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuOfficer, not RageUI.Visible(sMenuOfficer))
        while sMenuOfficer do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuOfficer, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.officer.categorie) do
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
                    if #AuthorizedWeapons.officer.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.officer.defcon) do
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
                        elseif #AuthorizedWeapons.officer.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.officer.defcon == 2 then
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
        if not RageUI.Visible(sMenuOfficer) then
                sMenuOfficer = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end


    function MenuSergeantC()
        local sMenuSergeantC = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuSergeantC:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuSergeantC, not RageUI.Visible(sMenuSergeantC))
        while sMenuSergeantC do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuSergeantC, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.sergeantc.categorie) do
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
                    if #AuthorizedWeapons.sergeantc.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.sergeantc.defcon) do
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
                        elseif #AuthorizedWeapons.sergeantc.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.sergeantc.defcon == 2 then
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
        if not RageUI.Visible(sMenuSergeantC) then
                sMenuSergeantC = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end


    function MenuSergeant()
        local sMenuSergeant = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuSergeant:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuSergeant, not RageUI.Visible(sMenuSergeant))
        while sMenuSergeant do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuSergeant, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.sergeantc.categorie) do
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
                    if #AuthorizedWeapons.sergeantc.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.sergeantc.defcon) do
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
                        elseif #AuthorizedWeapons.sergeantc.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.sergeantc.defcon == 2 then
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
        if not RageUI.Visible(sMenuSergeant) then
                sMenuSergeant = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end

    function MenuLieutenant()
        local sMenuLieutenant = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuLieutenant:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuLieutenant, not RageUI.Visible(sMenuLieutenant))
        while sMenuLieutenant do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuLieutenant, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.lieutenant.categorie) do
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
                    if #AuthorizedWeapons.lieutenant.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.lieutenant.defcon) do
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
                        elseif #AuthorizedWeapons.lieutenant.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.lieutenant.defcon == 2 then
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
        if not RageUI.Visible(sMenuLieutenant) then
                sMenuLieutenant = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end

    function MenuCaptain()
        local sMenuCaptain = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuCaptain:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuCaptain, not RageUI.Visible(sMenuCaptain))
        while sMenuCaptain do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuCaptain, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.captain.categorie) do
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
                    if #AuthorizedWeapons.captain.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.captain.defcon) do
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
                        elseif #AuthorizedWeapons.captain.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.captain.defcon == 2 then
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
        if not RageUI.Visible(sMenuCaptain) then
                sMenuCaptain = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end

    function MenuCommandant()
        local sMenuCommandant = RageUI.CreateMenu("Armurerie", "Armurerie du LSPD")
        sMenuCommandant:SetRectangleBanner(0, 0, 0, 255)
        RageUI.Visible(sMenuCommandant, not RageUI.Visible(sMenuCommandant))
        while sMenuCommandant do 
            Citizen.Wait(0)
            RageUI.IsVisible(sMenuCommandant, true, true,true, function()
                for u,j in pairs (AuthorizedWeapons.boss.categorie) do
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
                    if #AuthorizedWeapons.boss.defcon ~= 0 then
                        RageUI.Separator('↓ ~b~ Équipement - ~g~[Defcon]~s~ ↓')
                        if defcon then
                            for l,m in pairs(AuthorizedWeapons.boss.defcon) do
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
                        elseif #AuthorizedWeapons.boss.defcon == 1 then
                            RageUI.ButtonWithStyle("÷ LSPD -~b~ Équipement : ~g~[Defcon]",nil,  {RightBadge = RageUI.BadgeStyle.Lock },true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    
                                end
                            end)
                        elseif #AuthorizedWeapons.boss.defcon == 2 then
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
        if not RageUI.Visible(sMenuCommandant) then
                sMenuCommandant = RMenu:DeleteType("Armurerie", true)
                               MenuArme()
            end
        end
    end





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
        local Timer = 500
        for k,v in pairs(posammu)do 
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, posammu[k].x, posammu[k].y, posammu[k].z)
            if distance <= 7.0  then
                Timer = 0
                DrawMarker(20, posammu[k].x, posammu[k].y, posammu[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if distance <= 2.0 then
                    Timer = 0   
                            RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour accéder à l'armurerie ", time_display = 1 })
                            if IsControlJustPressed(1,51) then           
                                MenuAmmu()
                        end   
                    end
                end 
            end
        Citizen.Wait(Timer)
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

