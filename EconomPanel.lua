local EconomPanel = {}
local sizescrx,sizescry = Renderer.GetScreenSize()
EconomPanel.optionEnable = Menu.AddOptionBool		({"TheCrazy88", "Economic Panel"}, "On|Off Script", true)
EconomPanel.TeamInfo = Menu.AddOptionBool			({"TheCrazy88", "Economic Panel"}, "Team difference", true)
EconomPanel.OnOffKey=Menu.AddKeyOption				({"TheCrazy88", "Economic Panel"}, "Key Open|Close panel",Enum.ButtonCode.BUTTON_CODE_NONE)
EconomPanel.posx = Menu.AddOptionSlider				({"TheCrazy88", "Economic Panel", "Settings"}, "Pos panel X", 1,sizescrx-1,500)
EconomPanel.posy = Menu.AddOptionSlider				({"TheCrazy88", "Economic Panel", "Settings"}, "Pos panel Y", 1,sizescry-1,500)
EconomPanel.sizeIcon = Menu.AddOptionSlider			({"TheCrazy88", "Economic Panel", "Settings"}, "Size panel", 20,300,50)
EconomPanel.visibility = Menu.AddOptionSlider		({"TheCrazy88", "Economic Panel", "Settings"}, "Transparency panel", 50,255,255)

function EconomPanel.OnUpdate()
	if not Menu.IsEnabled(EconomPanel.optionEnable) then canDraw = false return end
	if Menu.IsKeyDownOnce(EconomPanel.OnOffKey) then
		EconomPanel.OnOfffPanel = not EconomPanel.OnOfffPanel 
	end
	if not EconomPanel.OnOfffPanel then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	EconomPanel.player = {}
	meepohas = false
	for _,hero in pairs(Heroes.GetAll()) do
		if hero and Entity.IsHero(hero) and not NPC.IsIllusion(hero) and
		(not NPC.HasState(hero,Enum.ModifierState.MODIFIER_STATE_UNSELECTABLE) and not NPC.HasState(hero,Enum.ModifierState.MODIFIER_STATE_NOT_ON_MINIMAP)) then
			if NPC.GetUnitName(hero) ~= "npc_dota_hero_meepo" or (NPC.GetUnitName(hero) == "npc_dota_hero_meepo" and not meepohas) then
				havemoney = 0
				for j = 0,14 do
					local item = NPC.GetItemByIndex(hero,j)
					if item ~= nil and item ~= 0 and Entity.IsAbility(item) and itemprice[Ability.GetName(item)] then
						if Ability.GetName(item) == "item_tango" then
							havemoney = havemoney + Item.GetCurrentCharges(item)*(itemprice[Ability.GetName(item)]/3)
						elseif Ability.GetName(item) == "item_dust" then
							havemoney = havemoney + Item.GetCurrentCharges(item)*(itemprice[Ability.GetName(item)]/2)
						elseif 	Ability.GetName(item) == "item_tpscroll" or 
								Ability.GetName(item) == "item_ward_observer" or 
								Ability.GetName(item) == "item_ward_sentry" or 
								Ability.GetName(item) == "item_clarity" or 
								Ability.GetName(item) == "item_flask" or
								Ability.GetName(item) == "item_smoke_of_deceit" then
							havemoney = havemoney + Item.GetCurrentCharges(item)*(itemprice[Ability.GetName(item)])
						elseif Ability.GetName(item) == "item_ward_dispenser" and Item.GetCurrentCharges(item) > 1 then
							havemoney = havemoney + (itemprice[Ability.GetName(item)]) + (Item.GetCurrentCharges(item)-1)*itemprice["item_ward_observer"]
						else
							havemoney = havemoney + itemprice[Ability.GetName(item)]
						end
					end
				end
				table.insert(EconomPanel.player,{hero, math.floor(havemoney)})
				if NPC.GetUnitName(hero) == "npc_dota_hero_meepo" then
					meepohas = true
				end
			end
		end
	end
	table.sort(EconomPanel.player, function(t1, t2) return t1[2] > t2[2] end)
	if #EconomPanel.player >= 1 and not canDraw then
		canDraw = true
	end
end

function EconomPanel.OnDraw()
	if canDraw and EconomPanel.player and EconomPanel.OnOfffPanel then
		xpos = Menu.GetValue(EconomPanel.posx)
		ypos =  Menu.GetValue(EconomPanel.posy)
		sizeamountx =  Menu.GetValue(EconomPanel.sizeIcon)
		visibility =  Menu.GetValue(EconomPanel.visibility)
		sizeBarx = sizeamountx/3*0.75
		sizeBary = sizeBarx * 1.2
		if not EconomPanel.Font then 
			EconomPanel.Font = Renderer.LoadFont("Tahoma", math.ceil(Menu.GetValue(EconomPanel.sizeIcon)/3.5), Enum.FontWeight.EXTRABOLD)
		end
		local myteamcoint = 0
		local enteamcoint = 0
		for _,hero in pairs(EconomPanel.player) do
			Renderer.SetDrawColor(255,255,255,visibility)
			if hero[1] and Heroes.Contains(hero[1]) then
				local imageHandle
				if not heroicon[hero[1]] then
					heroicon[hero[1]] = Renderer.LoadImage("resource/flash3/images/heroes/selection/".. NPC.GetUnitName(hero[1]) ..".png")
				end
				imageHandle = heroicon[hero[1]]
				local prochent = hero[2]/(EconomPanel.player[1][2]/100)/100*2
				if imageHandle then
					Renderer.DrawImage(imageHandle, math.ceil(xpos), math.ceil(ypos), math.ceil(sizeBarx), math.ceil(sizeBary))
				end
				xpos = xpos + sizeBarx
				if Heroes.GetLocal() and Entity.IsSameTeam(Heroes.GetLocal(),hero[1]) then
					Renderer.SetDrawColor(0,100,0,visibility)
					myteamcoint = myteamcoint + hero[2]
				else
					Renderer.SetDrawColor(100,0,0,visibility)
					enteamcoint = enteamcoint + hero[2]
				end
				Renderer.DrawFilledRect(math.ceil(xpos+1),math.ceil(ypos+1),math.ceil(sizeamountx*prochent),math.ceil(sizeBary-2))
				Renderer.SetDrawColor(0,255,255,visibility)
				Renderer.DrawText(EconomPanel.Font, math.ceil(xpos + 10), math.ceil(ypos+1), hero[2], 1)
				ypos = ypos + sizeBary
				xpos = Menu.GetValue(EconomPanel.posx)
			end
		end
		if Menu.IsEnabled(EconomPanel.TeamInfo) and myteamcoint and enteamcoint then
			local procent = myteamcoint/((myteamcoint+enteamcoint)/100)
			ypos = Menu.GetValue(EconomPanel.posy) - sizeBary - 2
			xpos = xpos + sizeBarx
			Renderer.SetDrawColor(100,0,0,visibility)
			Renderer.DrawFilledRect(math.ceil(xpos+1+(sizeamountx*procent/100*2)),math.ceil(ypos+1),math.ceil(sizeamountx*(100-procent)/100*2),math.ceil(sizeBary-2))
			Renderer.SetDrawColor(0,100,0,visibility)
			Renderer.DrawFilledRect(math.ceil(xpos+1),math.ceil(ypos+1),math.ceil(sizeamountx*procent/100*2),math.ceil(sizeBary-2))
			Renderer.SetDrawColor(0,255,255,visibility)
			Renderer.DrawText(EconomPanel.Font, math.ceil(xpos + 5), math.ceil(ypos+1), math.floor(procent) .. "%", 1)
			Renderer.SetDrawColor(0,255,255,visibility)
			Renderer.DrawText(EconomPanel.Font, math.ceil(xpos + sizeamountx *1.4), math.ceil(ypos+1), math.floor(100 - procent) .. "%", 1)
		end
	end
	Renderer.SetDrawColor(255,255,255,255)
end

function EconomPanel.OnMenuOptionChange(option, oldValue, newValue)
	if EconomPanel.sizeIcon == option then
		EconomPanel.Font = Renderer.LoadFont("Tahoma", math.ceil(Menu.GetValue(EconomPanel.sizeIcon)/3.5), Enum.FontWeight.EXTRABOLD)
	end
end

function EconomPanel.init()
	canDraw = false
	meepohas = false
	EconomPanel.player = {}
	EconomPanel.OnOfffPanel = true
	heroicon = {}
	itemprice = {}
do
	itemprice["item_aegis"] = 0 --"Aegis of the Immortal"
	itemprice["item_cheese"] = 0 -- "Cheese"
	itemprice["item_tango_single"] = 0 -- "Tango (Shared)"
	itemprice["item_courier"] = 50 -- "Animal Courier"
	itemprice["item_boots_of_elves"] = 450 -- "Band of Elvenskin"
	itemprice["item_belt_of_strength"] = 450 -- "Belt of Strength"
	itemprice["item_blade_of_alacrity"] = 1000 -- "Blade of Alacrity"
	itemprice["item_blades_of_attack"] = 430 -- "Blades of Attack"
	itemprice["item_blight_stone"] = 300 -- "Blight Stone"
	itemprice["item_blink"] = 2250 -- "Blink Dagger"
	itemprice["item_boots"] = 500 -- "Boots of Speed"
	itemprice["item_bottle"] = 650 -- "Bottle"
	itemprice["item_broadsword"] = 1200 -- "Broadsword"
	itemprice["item_chainmail"] = 550 -- "Chainmail"
	itemprice["item_circlet"] = 165 -- "Circlet"
	itemprice["item_clarity"] = 50 -- "Clarity"
	itemprice["item_claymore"] = 1400 -- "Claymore"
	itemprice["item_cloak"] = 550 -- "Cloak"
	itemprice["item_demon_edge"] = 2200 -- "Demon Edge"
	itemprice["item_dust"] = 180 -- "Dust of Appearance"
	itemprice["item_eagle"] = 3200 -- "Eaglesong"
	itemprice["item_enchanted_mango"] = 70 -- "Enchanted Mango"
	itemprice["item_energy_booster"] = 900 -- "Energy Booster"
	itemprice["item_faerie_fire"] = 70 -- "Faerie Fire"
	itemprice["item_gauntlets"] = 135 -- "Gauntlets of Strength"
	itemprice["item_gem"] = 900 -- "Gem of True Sight"
	itemprice["item_ghost"] = 1500 -- "Ghost Scepter"
	itemprice["item_gloves"] = 500 -- "Gloves of Haste"
	itemprice["item_flask"] = 110 -- "Healing Salve"
	itemprice["item_helm_of_iron_will"] = 900 -- "Helm of Iron Will"
	itemprice["item_hyperstone"] = 2000 -- "Hyperstone"
	itemprice["item_infused_raindrop"] = 225 -- "Infused Raindrop"
	itemprice["item_branches"] = 50 -- "Iron Branch"
	itemprice["item_javelin"] = 1100 -- "Javelin"
	itemprice["item_magic_stick"] = 200 -- "Magic Stick"
	itemprice["item_mantle"] = 135 -- "Mantle of Intelligence"
	itemprice["item_mithril_hammer"] = 1600 -- "Mithril Hammer"
	itemprice["item_lifesteal"] = 1100 -- "Morbid Mask"
	itemprice["item_mystic_staff"] = 2700 -- "Mystic Staff"
	itemprice["item_ward_observer"] = 80 -- "Observer Ward"
	itemprice["item_ogre_axe"] = 1000 -- "Ogre Club"
	itemprice["item_orb_of_venom"] = 275 -- "Orb of Venom"
	itemprice["item_platemail"] = 1400 -- "Platemail"
	itemprice["item_point_booster"] = 1200 -- "Point Booster"
	itemprice["item_quarterstaff"] = 875 -- "Quarterstaff"
	itemprice["item_quelling_blade"] = 200 -- "Quelling Blade"
	itemprice["item_reaver"] = 3000 -- "Reaver"
	itemprice["item_ring_of_health"] = 850 -- "Ring of Health"
	itemprice["item_ring_of_protection"] = 175 -- "Ring of Protection"
	itemprice["item_ring_of_regen"] = 300 -- "Ring of Regen"
	itemprice["item_robe"] = 450 -- "Robe of the Magi"
	itemprice["item_relic"] = 3800 -- "Sacred Relic"
	itemprice["item_sobi_mask"] = 325 -- "Sage's Mask"
	itemprice["item_ward_sentry"] = 100 -- "Sentry Ward"
	itemprice["item_shadow_amulet"] = 1300 -- "Shadow Amulet"
	itemprice["item_slippers"] = 135 -- "Slippers of Agility"
	itemprice["item_smoke_of_deceit"] = 80 -- "Smoke of Deceit"
	itemprice["item_staff_of_wizardry"] = 1000 -- "Staff of Wizardry"
	itemprice["item_stout_shield"] = 200 -- "Stout Shield"
	itemprice["item_talisman_of_evasion"] = 1450 -- "Talisman of Evasion"
	itemprice["item_tango"] = 90 -- "Tango"
	itemprice["item_tome_of_knowledge"] = 150 -- "Tome of Knowledge"
	itemprice["item_tpscroll"] = 50 -- "Town Portal Scroll"
	itemprice["item_ultimate_orb"] = 2150 -- "Ultimate Orb"
	itemprice["item_vitality_booster"] = 1100 -- "Vitality Booster"
	itemprice["item_void_stone"] = 850 -- "Void Stone"
	itemprice["item_wind_lace"] = 250 -- "Wind Lace"
	itemprice["item_abyssal_blade"] = 6900 -- "Abyssal Blade"
	itemprice["item_aether_lens"] = 2350 -- "Aether Lens"
	itemprice["item_ultimate_scepter"] = 4200 -- "Aghanim's Scepter"
	itemprice["item_arcane_boots"] = 1400 -- "Arcane Boots"
	itemprice["item_armlet"] = 2380 -- "Armlet of Mordiggian"
	itemprice["item_assault"] = 5250 -- "Assault Cuirass"
	itemprice["item_bfury"] = 4400 -- "Battle Fury"
	itemprice["item_black_king_bar"] = 3975 -- "Black King Bar"
	itemprice["item_blade_mail"] = 2200 -- "Blade Mail"
	itemprice["item_bloodstone"] = 4900 -- "Bloodstone"
	itemprice["item_bloodthorn"] = 7195 -- "Bloodthorn"
	itemprice["item_travel_boots"] = 2500 -- "Boots of Trave 1"
	itemprice["item_travel_boots_2"] = 4500 -- "Boots of Trave 2"
	itemprice["item_bracer"] = 465 -- "Bracer"
	itemprice["item_buckler"] = 800 -- "Buckler"
	itemprice["item_butterfly"] = 5525 -- "Butterfly"
	itemprice["item_crimson_guard"] = 3550 -- "Crimson Guard"
	itemprice["item_lesser_crit"] = 2130 -- "Crystalys"
	itemprice["item_greater_crit"] = 5320 -- "Daedalus"
	itemprice["item_dagon"] = 2715 -- "Dagon 1"
	itemprice["item_dagon_2"] = 3965 -- "Dagon 2"
	itemprice["item_dagon_3"] = 5215 -- "Dagon 3"
	itemprice["item_dagon_4"] = 6465 -- "Dagon 4"
	itemprice["item_dagon_5"] = 7715 -- "Dagon 5"
	itemprice["item_desolator"] = 3500 -- "Desolator"
	itemprice["item_diffusal_blade"] = 3150 -- "Diffusal Blade"
	itemprice["item_dragon_lance"] = 1900 -- "Dragon Lance"
	itemprice["item_ancient_janggo"] = 1615 -- "Drum of Endurance"
	itemprice["item_echo_sabre"] = 2650 -- "Echo Sabre"
	itemprice["item_ethereal_blade"] = 4700 -- "Ethereal Blade"
	itemprice["item_cyclone"] = 2750 -- "Eul's Scepter of Divinity"
	itemprice["item_skadi"] = 5500 -- "Eye of Skadi"
	itemprice["item_force_staff"] = 2250 -- "Force Staff"
	itemprice["item_glimmer_cape"] = 1850 -- "Glimmer Cape"
	itemprice["item_guardian_greaves"] = 5350 -- "Guardian Greaves"
	itemprice["item_hand_of_midas"] = 2150 -- "Hand of Midas"
	itemprice["item_headdress"] = 650 -- "Headdress"
	itemprice["item_heart"] = 5200 -- "Heart of Tarrasque"
	itemprice["item_heavens_halberd"] = 3600 -- "Heaven's Halberd"
	itemprice["item_helm_of_the_dominator"] = 2000 -- "Helm of the Dominator"
	itemprice["item_hood_of_defiance"] = 1700 -- "Hood of Defiance"
	itemprice["item_hurricane_pike"] = 4615 -- "Hurricane Pike"
	itemprice["item_sphere"] = 5050 -- "Linken's Sphere"
	itemprice["item_lotus_orb"] = 4000 -- "Lotus Orb"
	itemprice["item_maelstrom"] = 2700 -- "Maelstrom"
	itemprice["item_magic_wand"] = 450 -- "Magic Wand"
	itemprice["item_manta"] = 4800 -- "Manta Style"
	itemprice["item_mask_of_madness"] = 1975 -- "Mask of Madness"
	itemprice["item_medallion_of_courage"] = 1175 -- "Medallion of Courage"
	itemprice["item_mekansm"] = 2350 -- "Mekansm"
	itemprice["item_mjollnir"] = 5600 -- "Mjollnir"
	itemprice["item_monkey_king_bar"] = 4175 -- "Monkey King Bar"
	itemprice["item_moon_shard"] = 4000 -- "Moon Shard"
	itemprice["item_necronomicon"] = 2400 -- "Necronomicon 1"
	itemprice["item_necronomicon_2"] = 3700 -- "Necronomicon 2"
	itemprice["item_necronomicon_3"] = 5000 -- "Necronomicon 3"
	itemprice["item_null_talisman"] = 465 -- "Null Talisman"
	itemprice["item_oblivion_staff"] = 1650 -- "Oblivion Staff"
	itemprice["item_ward_dispenser"] = 180 -- "Observer and Sentry Wards"
	itemprice["item_octarine_core"] = 5900 -- "Octarine Core"
	itemprice["item_orchid"] = 4075 -- "Orchid Malevolence"
	itemprice["item_pers"] = 1700 -- "Perseverance"
	itemprice["item_phase_boots"] = 1360 -- "Phase Boots"
	itemprice["item_pipe"] = 3150 -- "Pipe of Insight"
	itemprice["item_power_treads"] = 1450 -- "Power Treads"
	itemprice["item_radiance"] = 5150 -- "Radiance"
	itemprice["item_rapier"] = 6000 -- "Divine Rapier"
	itemprice["item_refresher"] = 5200 -- "Refresher Orb"
	itemprice["item_ring_of_aquila"] = 965 -- "Ring of Aquila"
	itemprice["item_ring_of_basilius"] = 500 -- "Ring of Basilius"
	itemprice["item_rod_of_atos"] = 2930 -- "Rod of Atos"
	itemprice["item_sange"] = 2150 -- "Sange"
	itemprice["item_sange_and_yasha"] = 4300 -- "Sange and Yasha"
	itemprice["item_satanic"] = 5500 -- "Satanic"
	itemprice["item_sheepstick"] = 5700 -- "Scythe of Vyse"
	itemprice["item_invis_sword"] = 2700 -- "Shadow Blade"
	itemprice["item_shivas_guard"] = 4750 -- "Shiva's Guard"
	itemprice["item_silver_edge"] = 5550 -- "Silver Edge"
	itemprice["item_basher"] = 3050 -- "Skull Basher"
	itemprice["item_solar_crest"] = 2625 -- "Solar Crest"
	itemprice["item_soul_booster"] = 3200 -- "Soul Booster"
	itemprice["item_soul_ring"] = 770 -- "Soul Ring"
	itemprice["item_tranquil_boots"] = 1050 -- "Tranquil Boots"
	itemprice["item_urn_of_shadows"] = 875 -- "Urn of Shadows"
	itemprice["item_vanguard"] = 2150 -- "Vanguard"
	itemprice["item_veil_of_discord"] = 2330 -- "Veil of Discord"
	itemprice["item_vladmir"] = 2250 -- "Vladmir's Offering"
	itemprice["item_wraith_band"] = 465 -- "Wraith Band"
	itemprice["item_yasha"] = 2150 -- "Yasha"
	itemprice["item_kaya"] = 1950 -- "Kaya"
	itemprice["item_aeon_disk"] = 3350 -- "Aeon Disk"
	itemprice["item_nullifier"] = 4700 -- "Nullifier"
	itemprice["item_spirit_vessel"] = 2975 -- "Spirit Vessel"
	itemprice["item_meteor_hammer"] = 2625 -- "Meteor Hammer"
end
end

function EconomPanel.OnGameStart()
  EconomPanel.init()
end
function EconomPanel.OnGameEnd()
  EconomPanel.init()
end
EconomPanel.init()

return EconomPanel