local AutoDagon122112 = {}
AutoDagon122112.optionEnable = Menu.AddOptionBool({"TheCrazy88"},"AutoDagon", true)

function AutoDagon122112.OnUpdate()
	if not Menu.IsEnabled(AutoDagon122112.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if not Entity.IsAlive(myHero) or NPC.IsStunned(myHero) then return end
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
	if not dagon then dagon = NPC.GetItem(myHero, "item_dagon_2", true)
	if not dagon then dagon = NPC.GetItem(myHero, "item_dagon_3", true)
	if not dagon then dagon = NPC.GetItem(myHero, "item_dagon_4", true)
	if not dagon then dagon = NPC.GetItem(myHero, "item_dagon_5", true) 
	end	end	end	end
	if dagon and Ability.IsReady(dagon) and Ability.GetManaCost(dagon) <= NPC.GetMana(myHero) then
		local damageDagon = Ability.GetLevelSpecialValueForFloat(dagon, "damage")
		for _,hero in pairs(Heroes.GetAll()) do
			if hero ~= nil and hero ~= 0 and NPCs.Contains(hero) and NPC.IsEntityInRange(myHero,hero,Ability.GetCastRange(dagon)) and not Entity.IsSameTeam(hero,myHero) then
				if Entity.IsAlive(hero) and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) and AutoDagon122112.IsHasGuard(hero) == "nil" then
					local totaldomage = AutoDagon122112.GetDamageDagon(myHero,hero,damageDagon)
					if Entity.GetHealth(hero) <= totaldomage then
						Ability.CastTarget(dagon, hero)
					end
				end
			end
		end
	end
end

function AutoDagon122112.GetDamageDagon(mynpc,target,dmg)
	if not mynpc or not target then return end
	local BuffDmg = 0
	if Hero.GetPrimaryAttribute(mynpc) == 2 then 
		BuffDmg = Hero.GetIntellectTotal(mynpc) * (0.07 * 1.25)
	else 
		BuffDmg = Hero.GetIntellectTotal(mynpc) * 0.07
	end
	if NPC.GetItem(mynpc, "item_kaya", true) then 
		BuffDmg = BuffDmg + 10 
	end
	local bonus_amp = 
	{
		 "special_bonus_spell_amplify_3"
		,"special_bonus_spell_amplify_4"
		,"special_bonus_spell_amplify_5"
		,"special_bonus_spell_amplify_6"
		,"special_bonus_spell_amplify_8"
		,"special_bonus_spell_amplify_10"
		,"special_bonus_spell_amplify_12"
		,"special_bonus_spell_amplify_15"
		,"special_bonus_spell_amplify_20"
		,"special_bonus_spell_amplify_25"
	}
	for _,nameskill in pairs(bonus_amp) do
		if nameskill then
			local bonus_spell_amplify = NPC.GetAbility(mynpc, nameskill)
			if bonus_spell_amplify and Ability.GetLevel(bonus_spell_amplify) ~= 0 then
				BuffDmg = BuffDmg + Ability.GetLevelSpecialValueFor(bonus_spell_amplify, "value")
			end
		end
	end
	local totaldomage = (dmg * NPC.GetMagicalArmorDamageMultiplier(target)) * (BuffDmg/100+1)
	if NPC.HasModifier(target,"modifier_item_hood_of_defiance_barrier") then
		totaldomage = totaldomage - 325
	end
	if NPC.HasModifier(target,"modifier_item_pipe_barrier") then
		totaldomage = totaldomage - 400
	end
	if NPC.HasModifier(target,"modifier_ember_spirit_flame_guard") then
		local flame_guard = NPC.GetAbility(target, "ember_spirit_flame_guard")
		if flame_guard then
			totaldomage = totaldomage - Ability.GetLevelSpecialValueFor(flame_guard,"absorb_amount")
			local moredmgskill = NPC.GetAbility(target, "special_bonus_unique_ember_spirit_1")
			if moredmgskill and Ability.GetLevel(moredmgskill) ~= 0 then
				totaldomage = totaldomage - Ability.GetLevelSpecialValueFor(moredmgskill,"value")
			end
		else
			for _,hero in pairs(Heroes.GetAll()) do
				if hero~=nil and hero~=0 then
					flame_guard = NPC.GetAbility(hero, "ember_spirit_flame_guard")
					if flame_guard then
						totaldomage = totaldomage - Ability.GetLevelSpecialValueFor(flame_guard,"absorb_amount")
						local moredmgskill = NPC.GetAbility(target, "special_bonus_unique_ember_spirit_1")
						if moredmgskill and Ability.GetLevel(moredmgskill) ~= 0 then
							totaldomage = totaldomage - Ability.GetLevelSpecialValueFor(moredmgskill,"value")
						end
						break
					end
				end
			end
		end
	end
	if NPC.HasModifier(mynpc,"modifier_bloodseeker_bloodrage") then
		for _,hero in pairs(Heroes.GetAll()) do
			if hero~=nil and hero~=0 then
				local bloodrage = NPC.GetAbility(hero, "bloodseeker_bloodrage")
				if bloodrage then
					totaldomage = totaldomage * (1 + Ability.GetLevelSpecialValueFor(bloodrage,"damage_increase_pct")/100)
					break
				end
			end
		end
	end
	if NPC.HasModifier(target,"modifier_bloodseeker_bloodrage") then
		for _,hero in pairs(Heroes.GetAll()) do
			if hero~=nil and hero~=0 then
				local bloodrage = NPC.GetAbility(hero, "bloodseeker_bloodrage")
				if bloodrage then
					totaldomage = totaldomage * (1 + Ability.GetLevelSpecialValueFor(bloodrage,"damage_increase_pct")/100)
					break
				end
			end
		end
	end
	if NPC.HasModifier(target,"modifier_chen_penitence") then
		for _,hero in pairs(Heroes.GetAll()) do
			if hero~=nil and hero~=0 then
				penitence = NPC.GetAbility(hero, "chen_penitence")
				if penitence then
					totaldomage = totaldomage * (1 + Ability.GetLevelSpecialValueFor(penitence,"bonus_damage_taken")/100)
					break
				end
			end
		end
	end
	if NPC.HasModifier(target,"modifier_shadow_demon_soul_catcher") then
		for _,hero in pairs(Heroes.GetAll()) do
			if hero~=nil and hero~=0 then
				soul_catcher = NPC.GetAbility(hero, "shadow_demon_soul_catcher")
				if soul_catcher then
					totaldomage = totaldomage * (1 + Ability.GetLevelSpecialValueFor(soul_catcher,"bonus_damage_taken")/100)
					break
				end
			end
		end
	end
	local mana_shield = NPC.GetAbility(target, "medusa_mana_shield")
	if mana_shield and Ability.GetToggleState(mana_shield) then
		totaldomage = totaldomage * 0.4
	end
	if NPC.HasModifier(target,"modifier_nyx_assassin_burrow") then
		totaldomage = totaldomage * 0.6
	end
	if NPC.HasModifier(target,"modifier_ursa_enrage") then
		totaldomage = totaldomage * 0.2
	end
	local bristleback = NPC.GetAbility(target, "bristleback_bristleback")
	if bristleback and Ability.GetLevel(bristleback) ~= 0 then
		local vectortarget = Entity.GetAbsOrigin(target)
		local vectormy = Entity.GetAbsOrigin(Heroes.GetLocal())
		local taorig = Entity.GetRotation(target):GetYaw()
		local orig = -1 * (AutoDagon122112.Atan2(vectortarget:GetY()-vectormy:GetY(), vectortarget:GetX()-vectormy:GetX())/math.pi*180) + taorig
		if orig < 0 then orig = 360 + orig end
		if 110 < orig and orig < 250 then
			totaldomage = totaldomage
		elseif (70 < orig and orig <= 110) or (250 <= orig and orig < 290) then
			totaldomage = totaldomage * (1 - Ability.GetLevelSpecialValueFor(bristleback,"side_damage_reduction")/100)
		elseif (0 < orig and orig <= 70) or (290 <= orig and orig < 360) then
			totaldomage = totaldomage * (1 - Ability.GetLevelSpecialValueFor(bristleback,"back_damage_reduction")/100)
		end
	end
	return totaldomage
end

function AutoDagon122112.Atan2(y,x)
	if x > 0 then return math.atan(y/x) end
	if x < 0 and y >= 0 then return math.atan(y/x) + math.pi end
	if x < 0 and y < 0 then return math.atan(y/x) - math.pi end
	if x == 0 and y > 0 then return math.pi/2 end
	if x == 0 and y < 0 then return -1*(math.pi/2) end
	if x == 0 and y == 0 then return 0 end
end

function AutoDagon122112.IsHasGuard(npc)
	local guarditis = "nil"
	if NPC.IsLinkensProtected(npc) then guarditis = "Linkens" end
	if NPC.HasModifier(npc,"modifier_item_blade_mail_reflect") then guarditis = "BM" end
	local spell_shield = NPC.GetAbility(npc, "antimage_spell_shield")
	if not NPC.HasModifier(npc,"modifier_silver_edge_debuff") and spell_shield and Ability.IsReady(spell_shield) and (NPC.HasModifier(npc, "modifier_item_ultimate_scepter") or NPC.HasModifier(npc, "modifier_item_ultimate_scepter_consumed")) then
		guarditis = "Lotus"
	end
	if NPC.HasModifier(npc,"modifier_item_lotus_orb_active") then guarditis = "Lotus" end
	if 	NPC.HasState(npc,Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or 
		NPC.HasState(npc,Enum.ModifierState.MODIFIER_STATE_OUT_OF_GAME) or
		NPC.HasState(npc,Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) or
		NPC.HasState(npc,Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) or
		NPC.HasState(npc,Enum.ModifierState.MODIFIER_STATE_NO_HEALTH_BAR) or
		NPC.HasModifier(npc,"modifier_dazzle_shallow_grave") or
		NPC.HasModifier(npc,"modifier_medusa_stone_gaze_stone") or
		NPC.HasModifier(npc,"modifier_winter_wyvern_winters_curse") or
		NPC.HasModifier(npc,"modifier_templar_assassin_refraction_absorb") or
		NPC.HasModifier(npc,"modifier_nyx_assassin_spiked_carapace") or
		NPC.HasModifier(npc,"modifier_abaddon_borrowed_time") or
		NPC.HasModifier(npc,"modifier_item_aeon_disk_buff") or
		NPC.HasModifier(npc,"modifier_special_bonus_spell_block") then
			guarditis = "Immune"
	end
	if NPC.HasModifier(npc,"modifier_legion_commander_duel") then
		local duel = NPC.GetAbility(npc, "legion_commander_duel")
		if duel then
			if NPC.HasModifier(npc, "modifier_item_ultimate_scepter") or NPC.HasModifier(npc, "modifier_item_ultimate_scepter_consumed") then
				guarditis = "Immune"
			end
		else
			for _,hero in pairs(Heroes.GetAll()) do
				if hero ~= nil and hero ~= 0 and NPCs.Contains(hero) and not Entity.IsSameTeam(hero,npc) and NPC.HasModifier(hero,"modifier_legion_commander_duel") then
					local dueltarget = NPC.GetAbility(hero, "legion_commander_duel")
					if dueltarget then
						if NPC.HasModifier(hero, "modifier_item_ultimate_scepter") or NPC.HasModifier(hero, "modifier_item_ultimate_scepter_consumed") then
							guarditis = "Immune"
						end
					end
				end
			end
		end
	end
	local aeon_disk = NPC.GetItem(npc, "item_aeon_disk")
	if aeon_disk and Ability.IsReady(aeon_disk) then guarditis = "Immune" end
	return guarditis
end

return AutoDagon122112