local DisruptorCombo = {}
DisruptorCombo.optionEnable = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo"}, 		"Activation", true)
DisruptorCombo.tp_back = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo"}, 				"Glimpse for return after TP", true)
DisruptorCombo.Find_enemy_radius = Menu.AddOptionSlider({"TheCrazy88", "Disruptor Combo"}, 	"Distance for find Enemy", 50, 500, 500)
DisruptorCombo.auto_kinetic_field = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo"}, 	"Auto Kinetic Field", true)
DisruptorCombo.Key2= Menu.AddKeyOption({"TheCrazy88", "Disruptor Combo"}, 					"Full Combo", Enum.ButtonCode.BUTTON_CODE_NONE)
DisruptorCombo.Discord_Enable = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo", 		"Item manager"}, "Veil of Discord", true)
DisruptorCombo.Urn_Enable = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo", 			"Item manager"}, "Urn of Shadows", true)
DisruptorCombo.Spirit_Vessel_Enable = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo", 	"Item manager"}, "Spirit Vessel", true)
DisruptorCombo.Meteor_Enable = Menu.AddOptionBool({"TheCrazy88", "Disruptor Combo",			"Item manager"}, "Meteor Hammer", true)
DisruptorCombo.Font = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)

function DisruptorCombo.OnUpdate()
	if not Menu.IsEnabled(DisruptorCombo.optionEnable) or GameRules.GetGameTime() == nil or GameRules.GetGameTime() == 0 or not Heroes.GetLocal() then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if not Menu.IsKeyDown(DisruptorCombo.Key2) then
		if DisruptorCombo.glimpse_table then
			for i,j in pairs(DisruptorCombo.glimpse_table) do
				if DisruptorCombo.glimpse_table[i] then
					if j[3] + 2 <= GameRules.GetGameTime() then
						DisruptorCombo.glimpse_table[i] = nil
					end
				end
			end
		end
		local kinetic_field = NPC.GetAbility(myHero, "disruptor_kinetic_field")
		if kinetic_field and Ability.IsReady(kinetic_field) then
			if Menu.IsEnabled(DisruptorCombo.auto_kinetic_field) then
				DisruptorCombo.auto_kinetic_field_combo()
			end
		end
		local glimpse = NPC.GetAbility(myHero, "disruptor_glimpse")
		if glimpse and Ability.IsReady(glimpse) then
			if Menu.IsEnabled(DisruptorCombo.tp_back) then
				DisruptorCombo.go_back_to_base()
			end
		end
		DisruptorCombo.my_target = nil
		return
	end
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_disruptor" then return end
	if DisruptorCombo.my_target == nil or DisruptorCombo.my_target == 0 or (DisruptorCombo.my_target and not Entity.IsAlive(DisruptorCombo.my_target))then
		DisruptorCombo.my_target = DisruptorCombo.FindBestTarget()
	end
	local kinetic_field = NPC.GetAbility(myHero, "disruptor_kinetic_field")
	local thunder_strike = NPC.GetAbility(myHero, "disruptor_thunder_strike")
	local glimpse = NPC.GetAbility(myHero, "disruptor_glimpse")
	local static_storm = NPC.GetAbility(myHero, "disruptor_static_storm")
	local veil_of_discord = NPC.GetItem(myHero, "item_veil_of_discord")
	local urn_of_shadows = NPC.GetItem(myHero, "item_urn_of_shadows")
	local spirit_vessel = NPC.GetItem(myHero, "item_spirit_vessel")
	local meteor_hammer = NPC.GetItem(myHero, "item_meteor_hammer")
	if not glimpse then return end
	if DisruptorCombo.my_target and Entity.IsAlive(DisruptorCombo.my_target) and not Entity.IsDormant(DisruptorCombo.my_target) and not NPC.IsChannellingAbility(myHero) then
		if thunder_strike and Ability.IsReady(thunder_strike) and NPC.IsEntityInRange(myHero,DisruptorCombo.my_target,Ability.GetCastRange(thunder_strike)) then
			Ability.CastTarget(thunder_strike,DisruptorCombo.my_target)
		elseif Menu.IsEnabled(DisruptorCombo.Discord_Enable) and veil_of_discord and Ability.IsReady(veil_of_discord) and NPC.IsEntityInRange(myHero,DisruptorCombo.my_target,Ability.GetCastRange(veil_of_discord)) then	
			Ability.CastPosition(veil_of_discord,Entity.GetAbsOrigin(DisruptorCombo.my_target))
		elseif Menu.IsEnabled(DisruptorCombo.Urn_Enable) and urn_of_shadows and Ability.IsReady(urn_of_shadows) and NPC.IsEntityInRange(myHero,DisruptorCombo.my_target,Ability.GetCastRange(urn_of_shadows)) and Item.GetCurrentCharges(urn_of_shadows) ~= 0 then	
			Ability.CastTarget(urn_of_shadows,DisruptorCombo.my_target)
		elseif Menu.IsEnabled(DisruptorCombo.Spirit_Vessel_Enable) and spirit_vessel and Ability.IsReady(spirit_vessel) and NPC.IsEntityInRange(myHero,DisruptorCombo.my_target,Ability.GetCastRange(spirit_vessel)) and Item.GetCurrentCharges(spirit_vessel) ~= 0 then	
			Ability.CastTarget(spirit_vessel,DisruptorCombo.my_target)
		elseif not Ability.IsReady(static_storm) and NPC.HasModifier(DisruptorCombo.my_target,"modifier_disruptor_kinetic_field") then
			if Menu.IsEnabled(DisruptorCombo.Meteor_Enable) and meteor_hammer and Ability.IsReady(meteor_hammer) then	
				Ability.CastPosition(meteor_hammer,Entity.GetAbsOrigin(DisruptorCombo.my_target))
			end
		elseif glimpse and Ability.IsReady(glimpse) then
			Ability.CastTarget(glimpse,DisruptorCombo.my_target)
		else
			for i,j in pairs(DisruptorCombo.glimpse_table) do
				if DisruptorCombo.glimpse_table[i] then
					if kinetic_field and Ability.IsReady(kinetic_field) and not Ability.IsReady(glimpse) then
						Ability.CastPosition(kinetic_field,j[2])
					end
					if Menu.IsKeyDown(DisruptorCombo.Key2) then
						local disttopos = Entity.GetAbsOrigin(myHero):Distance(j[2]):Length2D()
						if disttopos > Ability.GetCastRange(static_storm) and not NPC.IsRunning(myHero) then
							NPC.MoveTo(myHero,j[2])
						end
						if static_storm and Ability.IsReady(static_storm) then
							if not Ability.IsReady(kinetic_field) then
								if j[3] < GameRules.GetGameTime() + 0.15 + NetChannel.GetLatency(Enum.Flow.MAX_FLOWS) then
									Ability.CastPosition(static_storm,j[2])
								end
							end
						end
					end
				end
			end
		end
	end
end

function DisruptorCombo.auto_kinetic_field_combo()
	local myHero = Heroes.GetLocal()
	local kinetic_field = NPC.GetAbility(myHero, "disruptor_kinetic_field")
	local glimpse = NPC.GetAbility(myHero, "disruptor_glimpse")
	for i,j in pairs(DisruptorCombo.glimpse_table) do
		if DisruptorCombo.glimpse_table[i] ~= nil and DisruptorCombo.glimpse_table[i] ~= 0 then
			if kinetic_field and Ability.IsReady(kinetic_field) and not Ability.IsReady(glimpse) then
				Ability.CastPosition(kinetic_field,j[2])
			end
		end
	end
end

function DisruptorCombo.go_back_to_base()
	local glimpse = NPC.GetAbility(Heroes.GetLocal(), "disruptor_glimpse")
	if glimpse and Ability.IsReady(glimpse) then
		for i,npcforback in pairs(DisruptorCombo.need_tp_back) do
			if npcforback[2] >= GameRules.GetGameTime() then
				if npcforback[1] ~= nil and npcforback[1] ~= 0 and NPCs.Contains(npcforback[1]) and Entity.IsAlive(npcforback[1]) and not Entity.IsDormant(npcforback[1]) then
					DisruptorCombo.timer_oreder = GameRules.GetGameTime() + 5
					Ability.CastTarget(glimpse,npcforback[1])
				end
			else
				DisruptorCombo.need_tp_back[i] = nil
			end
		end
	end
end

function DisruptorCombo.FindBestTarget()
	table_target = Heroes.InRadius(Input.GetWorldCursorPos(),Menu.GetValue(DisruptorCombo.Find_enemy_radius),Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_ENEMY)
	local best_dist = 9999
	local best_npc = nil
	if table_target then
		for _,npc in pairs(table_target) do
			if npc ~= nil and npc ~= 0 and Entity.IsAlive(npc) and not Entity.IsDormant(npc) and not NPC.IsIllusion(npc) and not NPC.HasState(npc,Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				if best_dist > Input.GetWorldCursorPos():Distance(Entity.GetAbsOrigin(npc)):Length2D() then
					best_dist = Input.GetWorldCursorPos():Distance(Entity.GetAbsOrigin(npc)):Length2D()
					best_npc = npc
				end
			end
		end
	end
	return best_npc
end

function DisruptorCombo.OnParticleCreate(particle)
	if not Menu.IsEnabled(DisruptorCombo.optionEnable) or GameRules.GetGameTime() == nil or GameRules.GetGameTime() == 0 or not Heroes.GetLocal() then return end
	if particle.name == "disruptor_glimpse_targetend" and DisruptorCombo.timer_oreder < GameRules.GetGameTime() then
		table.insert(DisruptorCombo.glimpse_table,{particle.index})
	elseif particle.name == "teleport_start" then
		table.insert(DisruptorCombo.tp_table,{particle.index, particle.entityForModifiers})
	end
end

function DisruptorCombo.OnParticleUpdate(particle)
	if not Menu.IsEnabled(DisruptorCombo.optionEnable) or GameRules.GetGameTime() == nil or GameRules.GetGameTime() == 0 or not Heroes.GetLocal() then return end
	for i,j in pairs(DisruptorCombo.glimpse_table) do
		if DisruptorCombo.glimpse_table[i] ~= nil and DisruptorCombo.glimpse_table[i] ~= 0 and j[1] == particle.index then
			if particle.position ~= nil and particle.position ~= 0 then
				local x,y,z = particle.position:GetX(),particle.position:GetY(),particle.position:GetZ()
				if x ~= y and y ~= z and z ~= x then
					DisruptorCombo.glimpse_table[i][2] = particle.position
				elseif x == y and y == z and z == x then
					DisruptorCombo.glimpse_table[i][3] = GameRules.GetGameTime() + particle.position:GetX()
				end
			end
		end
	end
end
function DisruptorCombo.OnParticleDestroy(particle)
	if not Menu.IsEnabled(DisruptorCombo.optionEnable) or GameRules.GetGameTime() == nil or GameRules.GetGameTime() == 0 or not Heroes.GetLocal() then return end
	for i,tpready in pairs(DisruptorCombo.tp_table) do
		if tpready and tpready[1] == particle.index then
			table.insert(DisruptorCombo.need_tp_back,{tpready[2], GameRules.GetGameTime() + 4 - NetChannel.GetLatency(Enum.Flow.MAX_FLOWS)})
			DisruptorCombo.tp_table[i] = nil
		end
	end
end

function DisruptorCombo.init()
	DisruptorCombo.glimpse_table = {}
	DisruptorCombo.tp_table = {}
	DisruptorCombo.need_tp_back = {}
	DisruptorCombo.timer_oreder = 0
	DisruptorCombo.my_target = nil
end

function DisruptorCombo.OnGameStart()
  DisruptorCombo.init()
end

function DisruptorCombo.OnGameEnd()
  DisruptorCombo.init()
end
DisruptorCombo.init()

return DisruptorCombo