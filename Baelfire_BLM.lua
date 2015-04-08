function get_sets()

	sets.magic = {}
	sets.magic['Elemental Magic'] = {
		main="Atinian staff",
		sub="Elementa Grip",
		ammo="Erlene's notebook",
		head="Buremte Hat",
		body="Hagondes Coat",
		hands="Otomi Gloves",
		legs="Hagondes Pants",
		feet="Hagondes Sabots",
		neck="Stoicheion Medal",
		waist="Searing Sash",
		left_ear="Hecate's Earring",
		right_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Demon's Ring",
		back="Bane Cape",}
		
	sets.magic['Enfeebling Magic'] = {}

	sets.magic['DarkMagic'] = {}
	sets.magic['DrainAspir'] = {right_ear="Hirudinea Earring"}

	sets.magic['EnhancingMagic'] = {
		waist="Cascade belt",}

	sets.Idle= {
		main="Atinian staff",
		sub="Oneiros Grip",
		ammo="Erlene's notebook",
		head="Wivre Hairpin",
		body="Hagondes Coat",
		hands="Hagondes Cuffs",
		legs="Nares Trews",
		feet="Herald's Gaiters",
		neck="Twilight Torque",
		waist="Searing Sash",
		left_ear="Hecate's Earring",
		right_ear="Novio Earring",
		left_ring="Defending Ring",
		right_ring="Sheltered Ring",
		back="Bane Cape",}

	sets.Precast = {}

	sets.magic['Healing Magic'] = {
		waist="Cascade belt",}
		
	sets.weather = {}
	sets.weather['Earth'] = {}
		
	sets.weather['Ice'] = {
		back="Twilight Cape",
		waist="Hyorin Obi",}

	sets.weather['Thunder'] = {}
		
	showinfo = false
end

function precast(spell)
	equip(sets.Precast)
end

function midcast(spell)
	if showinfo then
		add_to_chat(100,"→ Spell: " .. spell.english .. " : Spell element: " .. spell.element .. " World weather: " .. world.weather_element)
	end
	if spell.skill == "Elemental Magic" and spell.element == world.weather_element and sets.weather[world.weather_element] then
		equip(set_combine(sets.magic['Elemental Magic'],sets.weather[world.weather_element]))
	elseif string.find(spell.english,'Drain') or string.find(spell.english,'Aspir') then
		equip(set_combine(sets.magic['Elemental Magic'],sets.magic['DrainAspir']))
	elseif sets.magic[spell.skill] then
		equip(sets.magic[spell.skill])
	end
end

function aftercast(spell)
	equip(sets.Idle)
end

function self_command(command)
	command = string.upper(command)
	if command == 'SPELLINFO' then
		if showinfo then
			add_to_chat(100,"No longer displaying spell info")
			showinfo = false
		else
			add_to_chat(100,"Showing Spell Info")
			showinfo = true
		end
	end
end
