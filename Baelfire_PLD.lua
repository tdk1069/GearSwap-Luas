function get_sets()				
	sets.Idle = {
		main="Buramenk'ah",
		sub="Aegis",
		ammo="Soil Sachet",
		head="Rev. Coronet",
		body="Reverence Surcoat",
		hands="Cizin mufflers",
		legs="Rev. Breeches",
		feet={ name="Cizin Greaves", augments={'Phys. dmg. taken -1%','Accuracy+2',}},
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
		right_ring="Defending Ring",
		back="Weard Mantle",
	}
	
	sets.RR = {
	head = "Twilight Helm",
	body = "Twilight Mail",}
	
end

function precast(spell)
--	windower.add_to_chat(5,spell.recast_id)
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle)
	elseif new == 'Engaged' then
		equip(sets.Idle)
	end
end

