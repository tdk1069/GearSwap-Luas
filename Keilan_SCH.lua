include('organizer-lib.lua')

function get_sets() 
	sets.magic = {}
	
	sets.magic['Elemental Magic'] = {
		main="Homestead staff",sub="Elementa Grip",ammo="Erlene's notebook",head="Buremte hat",
		body="Hagondes coat",hands="Otomi gloves",legs="Hagondes Pants",feet="Wayfarer Clogs",
		neck="Stoicheion Medal",waist="Searing Sash",left_ear="Hecate's Earring",right_ear="Novio Earring",
		left_ring="Strendu Ring",right_ring="Acumen Ring",back="Bookworm's cape"}

	sets.magic['Impact'] = {
		main="Homestead staff",sub="Elementa Grip",ammo="Erlene's notebook",
		body="Twilight Cloak",hands="Otomi gloves",legs="Hagondes Pants",feet="Wayfarer Clogs",
		neck="Stoicheion Medal",waist="Searing Sash",left_ear="Hecate's Earring",right_ear="Loquac. Earring",
		left_ring="Strendu Ring",right_ring="Acumen Ring",back="Bookworm's cape"}
		
		
	sets.magic['Healing Magic'] = {
		head="Gendewitha Caubeen",neck="Nuna Gorget",body="Gendewitha bliaut",hands="Weatherspoon cuffs",
		waist="Cascade Belt",feet="Wayfarer clogs"}

	sets.Idle= {
		main="Homestead staff",sub="Elementa Grip",ammo="Incantor Stone",head="Kaabnax hat",body="Gendewitha bliaut",
		hands="Serpentes Cuffs",legs="Gendewitha spats",feet="Serpentes Sabots",neck="Stoicheion Medal",
		waist="Cognition Belt",left_ear="Hecate's Earring",right_ear="Loquac. Earring",
		left_ring="Strendu Ring",right_ring="Sheltered Ring",back="Bookworm's cape"}

	sets.Regen = {
		head="Savant's Bonnet +2"
	}

	sets.FastCast = {
		ammo="Incantor Stone",	-- Fast Cast 2%
		ear2="Loquac. Earring",	-- Fast Cast 2% 
		body="Anhur Robe",		-- Fast Cast 10%
		ring2="Prolix Ring",	-- Fast Cast 2%
		neck="Orunmila's Torque", -- Fast Cast +5
		head="Zelus tiara", 	-- Haste 8%
		hands="Gendewitha gages",	-- Haste 3%
		waist="Cetl Belt",		-- Haste 5%
		legs="Gendewitha spats",-- Haste 4%
		feet="Wayfarer clogs"	-- Haste 3%
		}

	sets.Haste = {
		head="Zelus tiara", 	-- Haste 8%
		hands="Gendewitha gages",	-- Haste 3%
		waist="Cetl Belt",		-- Haste 5%
		legs="Gendewitha spats",-- Haste 4%
		feet="Wayfarer clogs"	-- Haste 3%
		}
		
end

function precast(spell)
	if spell.english == 'Impact' then
		equip({Body = "Twilight Cloak"})
    elseif spell.action_type == 'Magic' then
		equip(sets.FastCast)
    end
end

function midcast(spell)
	if string.find(spell.english,'Regen') then
		equip(sets.Regen)
	elseif spell.english == "Impact" then
		equip(sets.magic['Impact'])
	elseif sets.magic[spell.skill] then
		equip(sets.magic[spell.skill])
	end
	if buffactive['Alacrity'] and spell.element == world.weather_element then
		equip({feet="Argute loafers"})
	end
end

function aftercast(spell)
	equip(sets.Idle)
--    send_command('@input /recast "'..spell.english..'"')
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle)
	elseif new == 'Engaged' then
		equip(sets.aftercast.TP)
	end
end


