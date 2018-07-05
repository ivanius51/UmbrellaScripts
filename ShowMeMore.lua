local ShowMeMore = {}
local size_x, size_y = Renderer.GetScreenSize()
ShowMeMore.optionEnable = Menu.AddOptionBool({"TheCrazy88","ShowMeMore"},"Activation Script", true)

ShowMeMore.CourierActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Courier Info"},"Activation", true)
ShowMeMore.CourierOnlyEnemy = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Courier Info"},"Only Enemy Courier", false)
ShowMeMore.CourierOpenOrCloseKey = Menu.AddKeyOption({"TheCrazy88","ShowMeMore","Courier Info"},"Key Open or Close info",Enum.ButtonCode.BUTTON_CODE_NONE)
ShowMeMore.CourierItembar = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Courier Info","Item Bar"},"Courier Item Bar Activation", true)
ShowMeMore.CourierOffsetXitembar = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Bar"},"Offset X item bar", -500, 500, 100)
ShowMeMore.CourierOffsetYitembar = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Bar"},"Offset Y item bar", -500, 500, 0)
ShowMeMore.CourierItemBarVisibility = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Bar"},"Transparent item bar", 10, 255, 255)
ShowMeMore.CourierItemBarSizeImg = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Bar"},"Size IMG", 8, 64, 36)
ShowMeMore.CourierItemPanel = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Courier Info","Item Panel"},"Courier Item Panel Activation", true)
ShowMeMore.CourierOffsetXItemPanel = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Panel"},"Offset X item panel", 0, size_x, 10)
ShowMeMore.CourierOffsetYItemPanel = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Panel"},"Offset Y item panel", 0, size_y, 10)
ShowMeMore.CourierItemPanelVisibility = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Panel"},"Transparent item panel", 10, 255, 255)
ShowMeMore.CourierItemPanelSizeImg = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Courier Info","Item Panel"},"Size IMG", 8, 64, 36)

ShowMeMore.RoshanActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Roshan Timer"},"Roshan Timer Activation", true)
ShowMeMore.RoshanParticleActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Roshan Timer"},"Timer in RoshPit", true)
ShowMeMore.RoshanTimerActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Roshan Timer","Timer"},"Activation", true)
ShowMeMore.RoshanTimerPosX = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Roshan Timer","Timer"},"Offset X timer", 0, size_x, 10)
ShowMeMore.RoshanTimerPosY = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Roshan Timer","Timer"},"Offset Y timer", 0, size_y, 10)
ShowMeMore.RoshanTimerVisibility = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Roshan Timer","Timer"},"Transparent timer", 10, 255, 255)
ShowMeMore.RoshanTimerSizeImg = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Roshan Timer","Timer"},"Size IMG", 8, 128, 100)

ShowMeMore.RuneNotificationActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Rune Notification"},"Rune Notification Activation", true)
ShowMeMore.RuneNotificationTime = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Rune Notification"},"Time in second", 30, 59, 50)
ShowMeMore.RuneMetodNotification = Menu.AddOptionCombo({"TheCrazy88","ShowMeMore","Rune Notification"}, "Metod Notification [not work]", {"Only myself","For team"}, 1)

ShowMeMore.MissingHeroActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Missing Hero"},"Missing Hero Activation", true)
ShowMeMore.MissingHeroBlackBackground = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Missing Hero"},"Black Background", true)
ShowMeMore.MissingHeroOpenClose = Menu.AddKeyOption({"TheCrazy88","ShowMeMore","Missing Hero"},"Key Open or Close panel",Enum.ButtonCode.BUTTON_CODE_NONE)
ShowMeMore.MissingHeroOffsetX = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Missing Hero"},"Offset X Position", 0, size_x, 50)
ShowMeMore.MissingHeroOffsetY = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Missing Hero"},"Offset Y Position", 0, size_y, 50)
ShowMeMore.MissingVisibility = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Missing Hero"},"Visibility Panel", 10, 255, 255)
ShowMeMore.MissingHeroSizeImg = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Missing Hero"},"Size IMG", 8, 64, 30)
ShowMeMore.MissingHeroOnMinimapActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Missing Hero","MiniMap Draw"},"Draw last position on MiniMap", true)
ShowMeMore.MissingHeroKeyDraw = Menu.AddKeyOption({"TheCrazy88","ShowMeMore","Missing Hero","MiniMap Draw"},"Key Draw on MiniMap",Enum.ButtonCode.BUTTON_CODE_NONE)
ShowMeMore.MissingHeroMiniMapSizeImg = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Missing Hero","MiniMap Draw"},"Size IMG", 500, 1500, 1000)

ShowMeMore.ShowMeEnemyActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Visible By Enemy"},"Visible By Enemy Activation", false)
ShowMeMore.ShowCourierActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Visible By Enemy"},"Show Courier", false)
ShowMeMore.ShowLaneCreepsActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Visible By Enemy"},"Show Lane Creeps", false)
ShowMeMore.ShowSummonsActivation = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Visible By Enemy"},"Show AllNPC", false)

ShowMeMore.ShowTawerRange = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","ShowTawerRange"},"ShowTawerRange Activation", true)
ShowMeMore.ShowTawerRangeOnlyEnemy = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","ShowTawerRange"},"Draw Allied Towers", false)
ShowMeMore.ShowTawerRangeDrawTarget = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","ShowTawerRange"},"Draw Target Tawer", true)

ShowMeMore.ShowMeModifierTimer = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Modifier Timer"},"Show Modifier Timer", true)
ShowMeMore.ShowMeModifierTimerAlliesEnt = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Modifier Timer"},"Show Modifier Timer on Allies", true)
ShowMeMore.ShowMeModifierTimerSizeIMG = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer"},"SizeIMG", 10, 100, 40)
ShowMeMore.ShowMeModifierTimerYoffset = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer"},"Y Offset IMG", -500, 500, 100)
ShowMeMore.ShowMeModifierTimerAdaptiveFont = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Modifier Timer"},"Dinamic Font(risk crash)", false)
ShowMeMore.ShowMeModifierTimerSizeFont = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer"},"Or Manual Size Font/Text", 0, 100, 40)
ShowMeMore.ShowMeModifierTimerRedColor = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer","Text Color"}, "Red", 0, 255, 255)
ShowMeMore.ShowMeModifierTimerGreenColor = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer","Text Color"}, "Green", 0, 255, 255)
ShowMeMore.ShowMeModifierTimerBlueColor = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer","Text Color"}, "Blue", 0, 255, 255)
ShowMeMore.ShowMeModifierTimerTransparent = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Modifier Timer","Text Color"}, "Transparent", 10, 255, 255)

ShowMeMore.ShowMeHidenEntity = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Hiden Entity"},"Show Me Hide Entity", true)
--[[ ShowMeMore.ShowMeHidenEntityDrawСircle = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Hiden Entity"},"Draw Сircle", true) ]]
ShowMeMore.ShowMeHidenEntitySizeImg = Menu.AddOptionSlider({"TheCrazy88","ShowMeMore","Hiden Entity"}, "Size IMG", 10, 100, 30)
ShowMeMore.ShowMeHidenEntityPsionicTrap = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Hiden Entity"},"Show Me Psionic Trap", true)
ShowMeMore.ShowMeHidenEntityEyesInTheForest = Menu.AddOptionBool({"TheCrazy88","ShowMeMore","Hiden Entity"},"Show Me Eyes In The Forest", true)

function ShowMeMore.OnDraw()
	if not ShowMeMore.InGame or not Heroes.GetLocal() then return end
	do
		if not ShowMeMore.RoshanFont then
			ShowMeMore.RoshanFont = Renderer.LoadFont("Tahoma", math.floor(Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.483), Enum.FontWeight.EXTRABOLD)
		end
		if not ShowMeMore.RoshanFont2 then
			ShowMeMore.RoshanFont2 = Renderer.LoadFont("Tahoma", math.floor(Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.3571), Enum.FontWeight.EXTRABOLD)
		end
		if not ShowMeMore.MissingHeroFont then
			ShowMeMore.MissingHeroFont = Renderer.LoadFont("Arial Black", math.floor(Menu.GetValue(ShowMeMore.MissingHeroSizeImg) * 1.5), Enum.FontWeight.EXTRABOLD)
		end
		if not ShowMeMore.ModifierFont then
			ShowMeMore.ModifierFont = Renderer.LoadFont("Arial Black", Menu.GetValue(ShowMeMore.ShowMeModifierTimerSizeFont), Enum.FontWeight.EXTRABOLD)
		end
	end
	ShowMeMore.TawerFunc()
	if Menu.IsEnabled(ShowMeMore.ShowMeModifierTimer) then
		ShowMeMore.ModifierTimerFunc()
	end
	if Menu.IsEnabled(ShowMeMore.MissingHeroActivation) and ShowMeMore.CanDrawMissingHero then
		ShowMeMore.MissHeroFunc()
	end
	local X1courier, Y1courier = Menu.GetValue(ShowMeMore.CourierOffsetXItemPanel), Menu.GetValue(ShowMeMore.CourierOffsetYItemPanel)
	local X2courier, Y2courier = Menu.GetValue(ShowMeMore.CourierOffsetXItemPanel), Menu.GetValue(ShowMeMore.CourierOffsetYItemPanel) + (Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) + 2) * 2.5
	for i = 0, NPCs.Count() do
		local npc = NPCs.Get(i)
		if npc and Entity.IsEntity(npc) then
			if Menu.IsEnabled(ShowMeMore.CourierActivation) and ShowMeMore.CanDrawCourier and (Menu.IsEnabled(ShowMeMore.CourierItembar) or Menu.IsEnabled(ShowMeMore.CourierItemPanel)) then
				if NPC.IsCourier(npc) and Entity.IsAlive(npc) then
					local x,y = Renderer.WorldToScreen(Entity.GetAbsOrigin(npc))
					x = x - Menu.GetValue(ShowMeMore.CourierOffsetXitembar)
					y = y - Menu.GetValue(ShowMeMore.CourierOffsetYitembar)
					for i = 0, 15 do
						local item = NPC.GetItemByIndex(npc, i) 
						if item and Entity.IsEntity(item) and Entity.IsAbility(item) and ((not Menu.IsEnabled(ShowMeMore.CourierOnlyEnemy) and Entity.IsSameTeam(Heroes.GetLocal(), npc)) or not Entity.IsSameTeam(Heroes.GetLocal(), npc)) then
							if not TableIMG[Ability.GetName(item)] then
								if Ability.GetName(item):find("item_recipe_") then
									TableIMG[Ability.GetName(item)] = Renderer.LoadImage("resource/flash3/images/items/recipe.png")
								else
									TableIMG[Ability.GetName(item)] = Renderer.LoadImage("resource/flash3/images/items/".. Ability.GetName(item):gsub("item_", "") ..".png")
								end
							end
							local OwnerImg = nil
							for i = 0, Heroes.Count() do
								local hero = Heroes.Get(i)
								if hero and Entity.IsEntity(hero) and Hero.GetPlayerID(hero) == Item.GetPlayerOwnerID(item) then
									if not TableIMG[hero] then
										TableIMG[hero] = Renderer.LoadImage("resource/flash3/images/heroes/selection/".. NPC.GetUnitName(hero) ..".png")
									end
									OwnerImg = TableIMG[hero]
								end
							end
							local ItemImg = TableIMG[Ability.GetName(item)]
							if Menu.IsEnabled(ShowMeMore.CourierItembar) and not Entity.IsDormant(npc) then
								Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ShowMeMore.CourierItemBarVisibility))
								if x and y and ShowMeMore.IsOnScreen(x, y) then
									if ItemImg then
										Renderer.DrawImage(ItemImg, x, y, Menu.GetValue(ShowMeMore.CourierItemBarSizeImg), Menu.GetValue(ShowMeMore.CourierItemBarSizeImg))
									end
									if OwnerImg then
										local x = x + (Menu.GetValue(ShowMeMore.CourierItemBarSizeImg) * 0.2 * 0.5)
										Renderer.DrawImage(OwnerImg, x, y - (Menu.GetValue(ShowMeMore.CourierItemBarSizeImg) + 2), math.ceil(Menu.GetValue(ShowMeMore.CourierItemBarSizeImg) * 0.85), Menu.GetValue(ShowMeMore.CourierItemBarSizeImg))
									end
									x = x + Menu.GetValue(ShowMeMore.CourierItemBarSizeImg) + 2
								end
							end
							if Menu.IsEnabled(ShowMeMore.CourierItemPanel) then
								Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ShowMeMore.CourierItemPanelVisibility))
								local x, y
								if Entity.GetTeamNum(npc) == 2 then
									X1courier = X1courier + Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) + 2
									x, y = X1courier, Y1courier
									if CourierRadiant then
										Renderer.DrawImage(CourierRadiant, Menu.GetValue(ShowMeMore.CourierOffsetXItemPanel), Menu.GetValue(ShowMeMore.CourierOffsetYItemPanel) - (Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) + 2) * 0.5, Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg), Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg))
									end
								else
									X2courier = X2courier + Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) + 2
									x, y = X2courier, Y2courier
									if CourierDire then
										Renderer.DrawImage(CourierDire, Menu.GetValue(ShowMeMore.CourierOffsetXItemPanel), Menu.GetValue(ShowMeMore.CourierOffsetYItemPanel) + (Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) + 2) * 2, Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg), Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg))
									end
								end
								if x and y then
									if ItemImg then
										Renderer.DrawImage(ItemImg,x,y,Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg),Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg))
									end
									if OwnerImg then
										local x = x + (Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) * 0.2 * 0.5)
										Renderer.DrawImage(OwnerImg,x,y - (Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) + 2),math.ceil(Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg) * 0.85),Menu.GetValue(ShowMeMore.CourierItemPanelSizeImg))
									end
								end
							end
						end
					end
				end
			end
			if Menu.IsEnabled(ShowMeMore.RoshanActivation) and (Menu.IsEnabled(ShowMeMore.RoshanParticleActivation) or Menu.IsEnabled(ShowMeMore.RoshanTimerActivation)) then
				if NPC.IsRoshan(npc) then
					if Entity.IsAlive(npc) then
						ShowMeMore.RoshanAlive = true
					else
						if ShowMeMore.RoshanAlive then
							ShowMeMore.RoshanAlive = false
							ShowMeMore.RoshanTimeDead = GameRules.GetGameTime() + 660
						end
					end
				end
			end
			if Menu.IsEnabled(ShowMeMore.ShowMeEnemyActivation) and not Entity.IsHero(npc) and Entity.IsAlive(npc) and Entity.IsSameTeam(Heroes.GetLocal(), npc) then
				if NPC.IsVisibleToEnemies(npc) and not ShowMeEnemyTableParticle[npc] then
					if Menu.IsEnabled(ShowMeMore.ShowSummonsActivation) and NPC.IsCreep(npc) then
						ShowMeEnemyTableParticle[npc] = Particle.Create(Shivas, Enum.ParticleAttachment.PATTACH_ABSORIGIN_FOLLOW,npc)
					elseif Menu.IsEnabled(ShowMeMore.ShowLaneCreepsActivation) and NPC.IsLaneCreep(npc) then
						ShowMeEnemyTableParticle[npc] = Particle.Create(Shivas, Enum.ParticleAttachment.PATTACH_ABSORIGIN_FOLLOW,npc)
					elseif Menu.IsEnabled(ShowMeMore.ShowCourierActivation) and NPC.IsCourier(npc) then
						ShowMeEnemyTableParticle[npc] = Particle.Create(Shivas, Enum.ParticleAttachment.PATTACH_ABSORIGIN_FOLLOW,npc)
					end
				end
			end
			if Menu.IsEnabled(ShowMeMore.ShowMeHidenEntity) and not Entity.IsSameTeam(npc, Heroes.GetLocal()) then
				if NPC.GetUnitName(npc) == "npc_dota_templar_assassin_psionic_trap" or NPC.GetUnitName(npc) == "npc_dota_treant_eyes" then
					local x, y = Renderer.WorldToScreen(Entity.GetAbsOrigin(npc))
					local sizeimg = Menu.GetValue(ShowMeMore.ShowMeHidenEntitySizeImg)
					if x and y and ShowMeMore.IsOnScreen(x, y) then
						if NPC.GetUnitName(npc) == "npc_dota_templar_assassin_psionic_trap" and Menu.IsEnabled(ShowMeMore.ShowMeHidenEntityPsionicTrap) then
							Renderer.DrawImage(PsionicTrapIMG, x - sizeimg * 0.5, y - sizeimg * 0.5, sizeimg, sizeimg)
						elseif NPC.GetUnitName(npc) == "npc_dota_treant_eyes" and Menu.IsEnabled(ShowMeMore.ShowMeHidenEntityEyesInTheForest) then
							Renderer.DrawImage(TreantTreeIMG, x - sizeimg * 0.5, y - sizeimg * 0.5, sizeimg, sizeimg)
						end
					end
				end
			end
		end
	end
	if Menu.IsEnabled(ShowMeMore.RoshanActivation) and (Menu.IsEnabled(ShowMeMore.RoshanParticleActivation) or Menu.IsEnabled(ShowMeMore.RoshanTimerActivation)) then
		local RoshanInfo1 = ""
		local RoshanInfo2 = ""
		if ShowMeMore.RoshanAlive then
			if ShowMeMore.RoshanData then
				Particle.Destroy(ShowMeMore.RoshanData)
				ShowMeMore.RoshanData = nil
			end
			RoshanInfo1 = "Alive"
		else
			if Menu.IsEnabled(ShowMeMore.RoshanParticleActivation) then
				if not ShowMeMore.RoshanData then
					ShowMeMore.RoshanData = Particle.Create(RoshanTimer)
					Particle.SetControlPoint(ShowMeMore.RoshanData, 0, Vector(-2425.0, 1925.0, 0.0))
					Particle.SetControlPoint(ShowMeMore.RoshanData, 10, Vector(93.0, 46.5, 2.0))
					Particle.SetControlPoint(ShowMeMore.RoshanData, 12, Vector(573.0, 543.0, 0.0))
					Particle.SetControlPoint(ShowMeMore.RoshanData, 13, Vector(480.0, 74.0, 1.0))
				end
			end
			local timer = math.floor(ShowMeMore.RoshanTimeDead - GameRules.GetGameTime())
			if timer % 60 < 10 then
				RoshanInfo1 = math.floor(timer / 60) .. ":0" .. timer % 60
				RoshanInfo2 = math.floor(timer / 60 - 4) .. ":0" .. timer % 60
			else
				RoshanInfo1 = math.floor(timer / 60) .. ":" .. timer % 60
				RoshanInfo2 = math.floor(timer / 60 - 4) .. ":" .. timer % 60
			end
		end
		if Menu.IsEnabled(ShowMeMore.RoshanTimerActivation) then
			local RoshanPosX = Menu.GetValue(ShowMeMore.RoshanTimerPosX)
			local RoshanPosY = Menu.GetValue(ShowMeMore.RoshanTimerPosY)
			if ShowMeMore.RoshanIMG then
				Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ShowMeMore.RoshanTimerVisibility))
				Renderer.DrawImage(ShowMeMore.RoshanIMG, RoshanPosX, RoshanPosY, Menu.GetValue(ShowMeMore.RoshanTimerSizeImg), math.floor(Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.5))
			end
			if RoshanInfo1 == "Alive" then
				Renderer.SetDrawColor(0, 255, 0, Menu.GetValue(ShowMeMore.RoshanTimerVisibility))
				ShowMeMore.DrawTextCentered(ShowMeMore.RoshanFont, math.floor(RoshanPosX + Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.5), math.floor(Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.25), RoshanInfo1, 1)
			else
				Renderer.SetDrawColor(255, 0, 0, Menu.GetValue(ShowMeMore.RoshanTimerVisibility))
				ShowMeMore.DrawTextCentered(ShowMeMore.RoshanFont2, math.floor(RoshanPosX + Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.5), math.floor(RoshanPosY + Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.5 * 0.3), RoshanInfo1, 1)
				ShowMeMore.DrawTextCentered(ShowMeMore.RoshanFont2, math.floor(RoshanPosX + Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.5), math.floor(RoshanPosY + Menu.GetValue(ShowMeMore.RoshanTimerSizeImg) * 0.5 * 0.7), RoshanInfo2, 1)
			end
		end
	end
	if Menu.IsEnabled(ShowMeMore.RuneNotificationActivation) and GameRules.GetGameState() == 5 then
		local usertimer = Menu.GetValue(ShowMeMore.RuneNotificationTime)
		local runetime = (GameRules.GetGameTime() - GameRules.GetGameStartTime() + 60 - usertimer) % 120
		local bauntirune = (GameRules.GetGameTime() - GameRules.GetGameStartTime() + 60 - usertimer) % 300
		local timecheck1 = runetime >= 0 and runetime < 0.5 or bauntirune >= 0 and bauntirune < 0.5
		local timecheck2 = runetime >= 0.5 and runetime < 1 or bauntirune >= 0.5 and bauntirune < 1
		if timecheck1 and not RuneNotif then
			Engine.ExecuteCommand("chatwheel_say 57") 
			Engine.ExecuteCommand("playsound sounds/ui/ping_rune.vsnd_c")
			RuneNotif = true
		end
		if timecheck2 and RuneNotif then
			Engine.ExecuteCommand("chatwheel_say 58")
			RuneNotif = false
		end
	end
end

function ShowMeMore.OnUpdate()
	if not Menu.IsEnabled(ShowMeMore.optionEnable) and not Heroes.Contains(Heroes.GetLocal()) then ShowMeMore.InGame = false return end
	if TableParticle then
		for npc,particle in pairs(TableParticle) do
			if Entity.IsEntity(npc) and not Entity.IsAlive(npc) then
				if particle then
					Particle.Destroy(particle)
					particle = nil
					TableParticle[npc] = nil
				end
			end
		end
	end
	if ShowMeEnemyTableParticle then
		for npc,particle in pairs(ShowMeEnemyTableParticle) do
			if Entity.IsEntity(npc) and (not Entity.IsAlive(npc) or not NPC.IsVisibleToEnemies(npc)) then
				Particle.Destroy(ShowMeEnemyTableParticle[npc])
				ShowMeEnemyTableParticle[npc] = nil
			end
		end
	end
	if Menu.IsEnabled(ShowMeMore.CourierActivation) and Menu.IsKeyDownOnce(ShowMeMore.CourierOpenOrCloseKey) then
		ShowMeMore.CanDrawCourier = not ShowMeMore.CanDrawCourier
	end
	if Menu.IsEnabled(ShowMeMore.MissingHeroActivation) and Menu.IsKeyDownOnce(ShowMeMore.MissingHeroOpenClose) then
		ShowMeMore.CanDrawMissingHero = not ShowMeMore.CanDrawMissingHero
	end
	ShowMeMore.InGame = true
end

function ShowMeMore.ModifierTimerFunc()
	for i = 0, Heroes.Count() do
		local hero = Heroes.Get(i)
		if hero and Entity.IsEntity(hero) and not NPC.IsIllusion(hero) and Entity.IsAlive(hero) and not Entity.IsDormant(hero) then
			local hasmodifier = ShowMeMore.GetModifiersOnNps(hero)
			local sizeimg = Menu.GetValue(ShowMeMore.ShowMeModifierTimerSizeIMG)
			local x, y = Renderer.WorldToScreen(Entity.GetAbsOrigin(hero))
			if x and y and ShowMeMore.IsOnScreen(x, y) then
				x = x - (sizeimg * #hasmodifier) * 0.5
				y = y + Menu.GetValue(ShowMeMore.ShowMeModifierTimerYoffset)
				for _,modifier in pairs(hasmodifier) do
					if modifier and Entity.IsAbility(Modifier.GetAbility(modifier)) and Modifier.GetDieTime(modifier) - GameRules.GetGameTime() > -0.01 then
						local AbilNameMod = Ability.GetName(Modifier.GetAbility(modifier))
						local Time = math.floor((Modifier.GetDieTime(modifier) - GameRules.GetGameTime()) * 10) * 0.1
						if Menu.IsEnabled(ShowMeMore.ShowMeModifierTimerAdaptiveFont) then
							if ShowMeMore.ModifierFont then
								local xsize, ysize = Renderer.GetTextSize(ShowMeMore.ModifierFont, Time)
								if xsize ~= sizeimg then
									needsize = sizeimg / xsize * ysize
									ShowMeMore.ModifierFont = Renderer.LoadFont("Arial Black", math.floor(needsize), Enum.FontWeight.EXTRABOLD)
								end
							end
						end
						if not ShowMeMore.ModifierTable[AbilNameMod] then
							if string.find(AbilNameMod, "item_") then
								ShowMeMore.ModifierTable[AbilNameMod] = Renderer.LoadImage("resource/flash3/images/items/" .. AbilNameMod:gsub("item_", "") .. ".png")
							else
								ShowMeMore.ModifierTable[AbilNameMod] = Renderer.LoadImage("resource/flash3/images/spellicons/" .. AbilNameMod .. ".png")
							end
						end
						local AbilIMG = ShowMeMore.ModifierTable[AbilNameMod]
						if AbilIMG then
							Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ShowMeMore.ShowMeModifierTimerTransparent))
							Renderer.DrawImage(AbilIMG, x, y, sizeimg, sizeimg)
							Renderer.SetDrawColor(Menu.GetValue(ShowMeMore.ShowMeModifierTimerRedColor), Menu.GetValue(ShowMeMore.ShowMeModifierTimerGreenColor), Menu.GetValue(ShowMeMore.ShowMeModifierTimerBlueColor), Menu.GetValue(ShowMeMore.ShowMeModifierTimerTransparent))
							ShowMeMore.DrawTextCentered(ShowMeMore.ModifierFont, math.floor(x + (sizeimg * 0.5)), math.floor(y + (sizeimg * 0.5)), Time, 1)
							x = x + sizeimg
						end
					end
				end
			end
		end
	end
end

function ShowMeMore.MissHeroFunc()
	for i = 0, Heroes.Count() do
        local j = Heroes.Get(i)
		if j and Entity.IsEntity(j) and not Entity.IsSameTeam(Heroes.GetLocal(),j) then
			if not ShowMeMore.MissingHeroTable[j] then
				ShowMeMore.MissingHeroTable[j] = {timer = 0, triger = false}
			end
		end
	end
	local PosX = Menu.GetValue(ShowMeMore.MissingHeroOffsetX)
	local PosY = Menu.GetValue(ShowMeMore.MissingHeroOffsetY)
	local SizeIMG = Menu.GetValue(ShowMeMore.MissingHeroSizeImg)
	for npc,info in pairs(ShowMeMore.MissingHeroTable) do
		if npc and Entity.IsEntity(npc) then
			if (not Entity.IsAlive(npc) or Entity.IsDormant(npc)) and not info.triger then
				info.timer = GameRules.GetGameTime()
				info.triger = true
			elseif Entity.IsAlive(npc) and not Entity.IsDormant(npc) and info.triger then
				info.timer = 0
				info.triger = false
			end
			if Menu.IsEnabled(ShowMeMore.MissingHeroOnMinimapActivation) and Entity.IsDormant(npc) then
				if Menu.IsKeyDown(ShowMeMore.MissingHeroKeyDraw) then
					MiniMap.DrawHeroIcon(NPC.GetUnitName(npc), Entity.GetAbsOrigin(npc), 255, 255, 255, 255, Menu.GetValue(ShowMeMore.MissingHeroMiniMapSizeImg))
				end
			end
			if not TableIMG[npc] then
				TableIMG[npc] = Renderer.LoadImage("resource/flash3/images/heroes/selection/".. NPC.GetUnitName(npc) ..".png")
			end
			local HeroIMG = TableIMG[npc]
			if HeroIMG then
				Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ShowMeMore.MissingVisibility))
				Renderer.DrawImage(HeroIMG,math.ceil(PosX),math.ceil(PosY),math.ceil(SizeIMG * 0.85),math.ceil(SizeIMG))
			end
			PosX = PosX + SizeIMG
			if Menu.IsEnabled(ShowMeMore.MissingHeroBlackBackground) then
				Renderer.SetDrawColor(0, 0, 0, Menu.GetValue(ShowMeMore.MissingVisibility))
				Renderer.DrawFilledRect(PosX,math.ceil(PosY),math.ceil(SizeIMG * 4),math.ceil(SizeIMG))
			end
			Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ShowMeMore.MissingVisibility))
			if info.timer > 0 then
				local timetoinvis = GameRules.GetGameTime() - info.timer
				local timeforwrite 
				if timetoinvis % 60 < 10 then
					timeforwrite = "" .. math.floor(timetoinvis / 60) .. ":0" .. math.floor(timetoinvis % 60) .. ""
				else
					timeforwrite = "" .. math.floor(timetoinvis / 60) .. ":" .. math.floor(timetoinvis % 60) .. ""
				end
				ShowMeMore.DrawTextCentered(ShowMeMore.MissingHeroFont, math.ceil(PosX + SizeIMG * 4 * 0.5),math.ceil(PosY + SizeIMG * 0.5), timeforwrite,1)
			else
				ShowMeMore.DrawTextCentered(ShowMeMore.MissingHeroFont, math.ceil(PosX + SizeIMG * 4 * 0.5),math.ceil(PosY + SizeIMG * 0.5), "Visible",1)
			end
		end
		PosX = Menu.GetValue(ShowMeMore.MissingHeroOffsetX)
		PosY = PosY + SizeIMG + SizeIMG * 0.05
	end
end

function ShowMeMore.TawerFunc()
	if ShowMeMore.TawersTable then
		for tawer,tawerinfo in pairs(ShowMeMore.TawersTable) do
			if tawer and Entity.IsEntity(tawer) then
				if not Entity.IsAlive(tawer) then
					if tawerinfo.particle then
						Particle.Destroy(tawerinfo.particle)
						tawerinfo.particle = nil
					end
					ShowMeMore.TawersTable[tawer] = nil
				end
				if not Menu.IsEnabled(ShowMeMore.ShowTawerRange) then
					if tawerinfo.particle then
						Particle.Destroy(tawerinfo.particle)
						tawerinfo.particle = nil
					end
					ShowMeMore.TawersTable[tawer] = nil
				end
				if not Menu.IsEnabled(ShowMeMore.ShowTawerRangeOnlyEnemy) and Entity.IsSameTeam(Heroes.GetLocal(), tawer) then
					if tawerinfo.particle then
						Particle.Destroy(tawerinfo.particle)
						tawerinfo.particle = nil
					end
					ShowMeMore.TawersTable[tawer] = nil
				end
			end
		end
	end
	if Menu.IsEnabled(ShowMeMore.ShowTawerRange) then
		for i = 0, NPCs.Count() do
			local j = NPCs.Get(i)
			if j and Entity.IsEntity(j) and NPC.IsStructure(j) and Entity.IsAlive(j) and NPC.IsTower(j) then
				if not ShowMeMore.TawersTable[j] then
					if not Entity.IsSameTeam(j,Heroes.GetLocal()) or (Menu.IsEnabled(ShowMeMore.ShowTawerRangeOnlyEnemy) and Entity.IsSameTeam(j,Heroes.GetLocal())) then 
						ShowMeMore.TawersTable[j] = {}
						ShowMeMore.TawersTable[j].particle = nil
						ShowMeMore.TawersTable[j].target = nil
						ShowMeMore.TawersTable[j].timer = 0
						ShowMeMore.TawerUpdateTiming = GameRules.GetGameTime() + 0.5
					end
				end
			end
		end
		if ShowMeMore.TawersTable and ShowMeMore.TawerUpdateTiming < GameRules.GetGameTime() then
			for i,j in pairs(ShowMeMore.TawersTable) do
				if j and Entity.IsEntity(i) then
					if not j.particle then
						j.particle = Particle.Create(TawerRing)
						Particle.SetControlPoint(j.particle, 2, Entity.GetOrigin(i))
						Particle.SetControlPoint(j.particle, 3, Vector(870, 0, 0))
						if Heroes.GetLocal() and Entity.IsSameTeam(i,Heroes.GetLocal()) then
							Particle.SetControlPoint(j.particle, 4, Vector(0, 255, 0))
						else
							Particle.SetControlPoint(j.particle, 4, Vector(255, 0, 0))
						end
						Particle.SetControlPoint(j.particle, 6, Vector(1, 0, 0))
						Particle.SetControlPoint(j.particle, 7, Entity.GetOrigin(i))
					else
						if j.target and (not Entity.IsEntity(j.target) or not Entity.IsAlive(j.target) or j.timer < GameRules.GetGameTime()) then
							j.target = nil
						end
						if Menu.IsEnabled(ShowMeMore.ShowTawerRangeDrawTarget) then
							if j.target then
								Particle.SetControlPoint(j.particle, 7, Entity.GetOrigin(j.target))
								Particle.SetControlPoint(j.particle, 6, Vector(1, 0, 0))
							else
								Particle.SetControlPoint(j.particle, 6, Vector(0, 0, 0))
							end
						end
					end
				end
			end
		end
	end
end

function ShowMeMore.OnProjectile(projectile)
	for tower,moreinfo in pairs(ShowMeMore.TawersTable) do
		if tower and moreinfo and tower == projectile.source then
			moreinfo.target = projectile.target
			moreinfo.timer = GameRules.GetGameTime() + 1.2
		end
	end
end

function ShowMeMore.OnMenuOptionChange(option, oldValue, newValue)
	if ShowMeMore.ShowMeModifierTimerSizeFont == option then
		ShowMeMore.ModifierFont = Renderer.LoadFont("Arial Black", newValue, Enum.FontWeight.EXTRABOLD)
	end
	if ShowMeMore.RoshanTimerSizeImg == option then
		ShowMeMore.RoshanFont = Renderer.LoadFont("Tahoma", math.floor(newValue * 0.483), Enum.FontWeight.EXTRABOLD)
		ShowMeMore.RoshanFont2 = Renderer.LoadFont("Tahoma", math.floor(newValue * 0.3571), Enum.FontWeight.EXTRABOLD)
	end
	if ShowMeMore.MissingHeroSizeImg == option then
		ShowMeMore.MissingHeroFont = Renderer.LoadFont("Arial Black", math.ceil(newValue * 1.5), Enum.FontWeight.EXTRABOLD)
	end
	if ShowMeMore.ShowMeEnemyParticle == option then
		if ShowMeEnemyTableParticle then
			for npc,particle in pairs(ShowMeEnemyTableParticle) do
				if particle then
					Particle.Destroy(particle)
					ShowMeEnemyTableParticle[npc] = nil
				end
			end
		end
	end
end

function ShowMeMore.OnParticleCreate(particle)
	if particle.name == "roshan_spawn" then
		ShowMeMore.RoshanAlive = true
	end
end

function ShowMeMore.DrawTextCentered(p1, p2, p3, p4, p5)
	local wide, tall = Renderer.GetTextSize(p1, p4)
	return Renderer.DrawText(p1, p2 - wide * 0.5 , p3 - tall * 0.5, p4)
end

function ShowMeMore.GetModifiersOnNps(npc)
    if not npc then return end
    local TableMod = {}
    if NPC.GetModifiers(npc) then
        for _,mod in pairs(NPC.GetModifiers(npc)) do
            if mod and Entity.IsAbility(Modifier.GetAbility(mod)) and Modifier.GetDieTime(mod) - GameRules.GetGameTime() > -0.01 then
                table.insert(TableMod, mod)
            end
        end
    end
    return TableMod
end

function ShowMeMore.IsOnScreen(x, y)
	if (x < 0) or (y < 0) then 
		return false 
	end
	if (x > size_x) or (y > size_y) then 
		return false 
	end
	return true
end

function ShowMeMore.init()
	ShowMeMore.RoshanTimeDead = 0
	ShowMeMore.TawerUpdateTiming = 0
	ShowMeMore.RoshanData = nil
	ShowMeMore.RoshanAlive = true
	ShowMeMore.InGame = false
	ShowMeMore.CanDrawCourier = true
	ShowMeMore.CanDrawMissingHero = true
	TableParticle = {}
	ShowMeEnemyTableParticle = {}
	ShowMeMore.TawersTable = {}
	TableIMG = {}
	ShowMeMore.MissingHeroTable = {}
	ShowMeMore.ModifierTable = {}
	RoshanTimer = "particles/neutral_fx/roshan_timer.vpcf"
	Shivas = "particles/items_fx/aura_shivas.vpcf"
	TawerRing = "particles/ui_mouseactions/range_finder_tower_aoe.vpcf"	
	CourierRadiant = Renderer.LoadImage("resource/flash3/images/items/courier_radiant.png")
	CourierDire = Renderer.LoadImage("resource/flash3/images/items/courier_dire.png")
	ShowMeMore.RoshanIMG = Renderer.LoadImage("resource/flash3/images/heroes/roshan.png")
	TreantTreeIMG = Renderer.LoadImage("resource/flash3/images/spellicons/treant_eyes_in_the_forest.png")
	PsionicTrapIMG = Renderer.LoadImage("resource/flash3/images/spellicons/templar_assassin_psionic_trap.png")
	ShowMeMore.Font = Renderer.LoadFont("Tahoma", 30, Enum.FontWeight.EXTRABOLD)
	ShowMeMore.RoshanFont = nil
	ShowMeMore.RoshanFont2 = nil
	ShowMeMore.MissingHeroFont = nil
	ShowMeMore.ModifierFont = nil
end
function ShowMeMore.OnGameStart()
	ShowMeMore.init()
end
function ShowMeMore.OnGameEnd()
	ShowMeMore.init()
end
function ShowMeMore.OnScriptLoad()
	ShowMeMore.init()
end
ShowMeMore.init()
return ShowMeMore