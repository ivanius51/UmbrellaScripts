local MiniMapDraw = {}
MiniMapDraw.TrigerActiv = Menu.AddOptionBool({"Kostya12rus", "MiniMapDraw"}, "Off/On", true)
MiniMapDraw.IconSize = Menu.AddOptionSlider({"Kostya12rus", "MiniMapDraw"}, "Size minimap icon", 500, 1500, 800)
MiniMapDraw.HeroIconOnly = Menu.AddOptionBool({"Kostya12rus", "MiniMapDraw"}, "Only Hero icon", false)

function MiniMapDraw.OnParticleCreate(particle)
	if not Menu.IsEnabled(MiniMapDraw.TrigerActiv) then return end
	for _,nameparticle in pairs(MiniMapDraw.TableIngoreParticleName) do
		if particle.name == nameparticle then
			return
		end
	end
	if not MiniMapDraw.TableParticle[particle.index] then
		MiniMapDraw.TableParticle[particle.index] = 
		{
			entity = particle.entity,
			poscast0 = nil,
			poscast1 = nil,
			timing = GameRules.GetGameTime() + 3,
			drawing = false
		}
	end
end

function MiniMapDraw.OnParticleUpdate(particle)
	if not Menu.IsEnabled(MiniMapDraw.TrigerActiv) then return end
	if MiniMapDraw.TableParticle[particle.index] then
		if particle.controlPoint == 0 then
			MiniMapDraw.TableParticle[particle.index].poscast0 = particle.position
		end
		if particle.controlPoint == 1 then
			MiniMapDraw.TableParticle[particle.index].poscast1 = particle.position
		end
	end
end

function MiniMapDraw.OnParticleUpdateEntity(particle)
	if not Menu.IsEnabled(MiniMapDraw.TrigerActiv) then return end
	if MiniMapDraw.TableParticle[particle.index] then
		if not MiniMapDraw.TableParticle[particle.index].entity and particle.entity and NPCs.Contains(particle.entity) then
			MiniMapDraw.TableParticle[particle.index].entity = particle.entity
		end
		if particle.controlPoint == 0 then
			MiniMapDraw.TableParticle[particle.index].poscast0 = particle.position
		end
		if particle.controlPoint == 1 then
			MiniMapDraw.TableParticle[particle.index].poscast1 = particle.position
		end
	end
end

function MiniMapDraw.OnParticleDestroy(particle)
	if not Menu.IsEnabled(MiniMapDraw.TrigerActiv) then return end
	if MiniMapDraw.TableParticle[particle.index] then
		MiniMapDraw.TableParticle[particle.index] = nil
	end
end

function MiniMapDraw.OnDraw()
	Renderer.SetDrawColor(255,255,255,255)
	if not Menu.IsEnabled(MiniMapDraw.TrigerActiv) or not GameRules.GetGameTime() then return end
	for i,tableinfo in pairs(MiniMapDraw.TableParticle) do
		if MiniMapDraw.TableParticle[i] then
			if MiniMapDraw.TableParticle[i].timing <= GameRules.GetGameTime() then
				MiniMapDraw.TableParticle[i] = nil
			end
		end
		if tableinfo.poscast0 then
			tableinfo.poscast0 = MiniMapDraw.CheckVector(tableinfo.poscast0)
		end
		if tableinfo.poscast1 then
			tableinfo.poscast1 = MiniMapDraw.CheckVector(tableinfo.poscast1)
		end
		if tableinfo.poscast0 or tableinfo.poscast1 then
			if tableinfo.entity ~= nil and tableinfo.entity ~= 0 and NPCs.Contains(tableinfo.entity) and Heroes.Contains(tableinfo.entity) then
				if tableinfo.poscast0 then
					MiniMap.DrawHeroIcon(NPC.GetUnitName(tableinfo.entity),tableinfo.poscast0, 255, 255, 255, 255, Menu.GetValue(MiniMapDraw.IconSize))
				else
					MiniMap.DrawHeroIcon(NPC.GetUnitName(tableinfo.entity),tableinfo.poscast1, 255, 255, 255, 255, Menu.GetValue(MiniMapDraw.IconSize))
				end
			else
				if not Menu.IsEnabled(MiniMapDraw.HeroIconOnly) then
					if tableinfo.poscast0 then
						MiniMap.DrawCircle(tableinfo.poscast0, 255, 0, 0, 255, Menu.GetValue(MiniMapDraw.IconSize))
					else
						MiniMap.DrawCircle(tableinfo.poscast1, 255, 0, 0, 255, Menu.GetValue(MiniMapDraw.IconSize))
					end
				end
			end
		end
	end
end

function MiniMapDraw.CheckVector(vec)
	local hasnpcinpos = NPCs.InRadius(vec,50,2,Enum.TeamType.TEAM_BOTH)
	if hasnpcinpos ~= nil and #hasnpcinpos ~= 0 then 			return nil end
	local distto0vect = vec:Distance(Vector(0,0,0)):Length2D()
	if distto0vect < 10 then 									return nil end
	local x,y,z = vec:GetX(),vec:GetY(),vec:GetZ()
	if x == y and x == z then 									return nil end
	if x == y or y == z or z == x then 							return nil end
	if x - math.floor(x) == 0 or y - math.floor(y) == 0 then 	return nil end
	return vec
end

function MiniMapDraw.init()
	MiniMapDraw.TableParticle = {}
	MiniMapDraw.TableIngoreParticleName = 
	{
		"dire_creep_spawn",
		"radiant_creep_spawn"
	}
end

function MiniMapDraw.OnGameStart()
  MiniMapDraw.init()
end

function MiniMapDraw.OnGameEnd()
  MiniMapDraw.init()
end
MiniMapDraw.init()

return MiniMapDraw