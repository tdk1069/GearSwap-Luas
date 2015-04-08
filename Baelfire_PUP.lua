function get_sets()				
	sets.TP={
		main="Oatixur",
		range="Em. Animator",
		ammo="Automat. Oil +3",
		head="Uk'uxkaj Cap",
		body="Qaaxo harness",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Asperity Necklace",
		waist="Kuku Stone",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Candent ring",
		right_ring="Epona's Ring",
		back="Dispersal Mantle",
	}
	sets.DT={
		main="Oatixur",
		range="Em. Animator",
		ammo="Automat. Oil +3",
		head="Uk'uxkaj Cap",
		body="Espial gambison",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Twilight Torque",
		waist="Kuku Stone",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Iximulew Cape",
	}
	sets.precast = {}
	sets.precast.Repair={
		left_ear="Guignol Earring",
	}	
	sets.precast['Stringing_Pummel']={
		main="Oatixur",
		head="Uk'uxkaj Cap",
		body="Espial gambison",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Asperity Necklace",
		waist="Wanion belt",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Candent ring",
		right_ring="Epona's Ring",
		back="Dispersal Mantle",
	}
	sets.aftercast = {}
	sets.aftercast.TP = sets.TP
	sets.aftercast.Idle = {ring1="Sheltered Ring",feet="Hermes' Sandals"}
end

function precast(spell,action)
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	elseif spell.type=="WeaponSkill" then
		equip(sets.precast['Stringing_Pummel'])
	end
end

function aftercast(spell,action)
	if player.status =='Engaged' then
		equip(sets.aftercast.TP)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(set_combine(sets.aftercast.TP,sets.aftercast.Idle))
	elseif new == 'Engaged' then
		equip(sets.aftercast.TP)
	end
end
