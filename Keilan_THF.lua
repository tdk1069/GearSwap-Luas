function get_sets()
	sets.TP={
		main="Leisilonu +1",
		sub="Thief's Knife",
		ammo="Thew Bomblet",
		head="Espial Cap",
		body="Wayfarer Robe",
		hands="Espial Bracers",
		legs="Quiahuiz Trousers",
		feet="Wayfarer Clogs",
		neck="Asperity Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Vehemence Ring",
		right_ring="Sheltered Ring",
		back="Atheling Mantle",
	}
	
	sets.Idle = {ring1="Sheltered Ring"}
	
	sets.WS = {}
	sets.WS['Exenterator'] = {neck="Huani Collar"}
	end

function precast(spell)
end

function midcast(spell)
	if sets.WS[spell.english] then
		equip(sets.WS[spell.english])
	end
end

function aftercast(spell)
	equip(sets.TP)
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle)
	elseif new == 'Engaged' then
		equip(sets.TP)
	end
end
