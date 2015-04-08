function get_sets()
	sets.Idle = {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",head="Gendewitha caubeen",
		body="Gendewitha bliaut",hands="Serpentes Cuffs",legs="Gendewitha spats",feet="Serpentes Sabots",
		neck="Nuna gorget",waist="Cascade Belt",left_ear="Loquac. Earring",right_ear="Pahtli Cape",
		left_ring="Sheltered Ring",right_ring="Sirona's Ring",back="Pahtli Cape",}

	sets.precast = {}
	sets.precast.FastCast = {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",head="Zelus tiara",
		body="Anhur Robe",hands="Gendewitha Gages",legs="Orison Pantaloons +2",feet="Gendewitha galoshes",
		neck="Nuna gorget",waist="Cascade Belt",left_ear="Loquac. Earring",right_ear="Orison Earring",
		left_ring="Aqua Ring",right_ring="Sirona's Ring",back="Pahtli Cape",}
		
	sets.midcast = {}
	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",head="Gendewitha caubeen",
		body="Gendewitha bliaut",hands="Weatherspoon cuffs",legs="Orsn. Pantaln. +2",feet="Wayfarer Clogs",
		neck="Nuna gorget",waist="Cascade Belt",left_ear="Beatific Earring",right_ear="Orison Earring",
		left_ring="Aqua Ring",right_ring="Sirona's Ring",back="Pahtli Cape",}

	sets.midcast.Regen = {hands="Orison Mitts +2",}
		
	sets.midcast.Cursna = {feet="Gendewitha galoshes", back="Mending Cape"}
end

function precast(spell)
	equip(sets.precast.FastCast)
	cast_delay(0.5)
end

function midcast(spell)
	if string.find(spell.english,'Cursna') then
		equip(sets.midcast.Cursna)
	elseif string.find(spell.english,'Cur') then 
		equip(sets.midcast.Cure)
	elseif string.find(spell.english,'Regen') then 
		equip(sets.midcast.Regen)
	end
end

function status_change(new,tab)
	if new == 'Resting' then
--		equip(sets['Resting'])
	else
		equip(sets.Idle)
	end
end


function aftercast(spell)
	equip(sets.Idle)
end