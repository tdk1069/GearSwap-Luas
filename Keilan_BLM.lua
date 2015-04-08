function get_sets()
	sets.magic = {}
	
	sets.magic['Elemental Magic'] = {
		main="Homestead staff",sub="Elementa Grip",ammo="Erlene's notebook",head="Kaabnax hat",
		body="Hagondes coat",hands="Otomi gloves",legs="Hagondes Pants",feet="Wayfarer Clogs",
		neck="Stoicheion Medal",waist="Searing Sash",left_ear="Hecate's Earring",right_ear="Loquac. Earring",
		left_ring="Strendu Ring",right_ring="Acumen Ring",back="bane cape"}
		
	sets.magic['Enfeebling Magic'] = {
		main="",
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

	sets.magic['Dark Magic'] = {
		main="",
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

	sets.magic['Enhancing Magic'] = {
		main="",
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

	sets.Idle= {
		main="Homestead staff",
		sub="Elementa Grip",
		ammo="Erlene's notebook",
		head="Kaabnax Hat",
		body="Hagondes coat",
		hands="Serpentes Cuffs",
		legs="Hagondes Pants",
		feet="Serpentes Sabots",
		neck="Stoicheion Medal",
		waist="Cognition Belt",
		left_ear="Hecate's Earring",
		right_ear="Loquac. Earring",
		left_ring="Strendu Ring",
		right_ring="Sheltered Ring",
		back="Bane cape"}

	sets.Precast = {
		main="",
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}
		
end

function precast(spell)
	equip(sets.Precast)
end

function midcast(spell)
	if sets.magic[spell.skill] then
		equip(sets.magic[spell.skill])
	end
end

function aftercast(spell)
	equip(sets.Idle)
end