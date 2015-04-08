function get_sets()
	sets.Idle = {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",head="Gendewitha caubeen",
		body="Gendewitha bliaut",hands="Serpentes Cuffs",legs="Gendewitha spats",feet="Serpentes Sabots",
		neck="Nuna gorget",waist="Cascade Belt",left_ear="Loquac. Earring",right_ear="Beatific Earring",
		left_ring="Sheltered Ring",right_ring="Sirona's Ring",back="Pahtli Cape",}

	sets.precast = {}
	sets.precast.FastCast = {}
		
	sets.midcast = {}
	sets.midcast.Cure = {hands="Weatherspoon cuffs",right_ear="Beatific Earring"}

	sets.midcast.Elemental = {mainhead="Buremte Hat",hands="Weatherspoon cuffs",left_ear="Beatific Earring"}

	sets.midcast.Regen = {}
		
	sets.midcast.Cursna = {}
end

function precast(spell)
	--add_to_chat(8,spell.english .. ' ' .. spell.casttime)
	equip(sets.precast.FastCast)
	cast_delay(0.5)
end

function midcast(spell)
	if string.find(spell.english,'Cur') then 
		equip(sets.midcast.Cure)
	elseif spell.skill == "ElementalMagic" then
		equip(sets.midcast.Elemental)
	end
end

function status_change(new,tab)
	if new == 'Resting' then
--
	else
		equip(sets.Idle)
	end
end


function aftercast(spell)
	equip(sets.Idle)
end