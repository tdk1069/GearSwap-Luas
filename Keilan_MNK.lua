function get_sets()				
	sets.precast = {}
	sets.precast.Chakra = {}
	sets.precast.Counterstance = {}
	sets.precast.Dodge = {}
	sets.precast.Mantra = {}
	sets.precast.Waltz = {}
		
	sets.TP = {}
	sets.TP.DD={
		main="Em. Baghnakhs",
		ammo="Thew Bomblet",
		head="Espial Cap",
		body="Espial Gambison",
		hands="Espial Bracers",
		legs="Otronif Brais",
		feet="Espial Socks",
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Vehemence Ring",
		right_ring="Keen Ring",
		back="Atheling Mantle",
	}

	sets.aftercast = {}
	sets.aftercast.Idle = {ring1="Sheltered Ring"}
	sets.aftercast.TP = sets.TP.DD
end

function precast(spell)
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	elseif spell.type=="WeaponSkill" then
		equip(sets.precast.WS)
	end
end

function midcast(spell)
end

function aftercast(spell)
	if player.status =='Engaged' then
		equip(sets.aftercast.TP)
	else
		equip(set_combine(sets.aftercast.TP,sets.aftercast.Idle))
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(set_combine(sets.aftercast.TP,sets.aftercast.Idle))
	elseif new == 'Engaged' then
		equip(sets.aftercast.TP)
	end
end

function buff_change(status,gain_or_loss)
end

function self_command(command)
	command = string.upper(command)
	if command == 'DT' then
		sets.aftercast.TP = sets.DT
		equip(sets.aftercast.TP)
		send_command('@input /echo DT Set Equipped')
	elseif command == 'TP' then
		sets.aftercast.TP = sets.TP.DD
		equip(sets.aftercast.TP)
		send_command('@input /echo TP Set Equipped')
	elseif command == 'ACC' then
		sets.aftercast.TP = set_combine(sets.aftercast.TP,sets.ACC)
		equip(sets.aftercast.TP)
		send_command('@input /echo ACC Set Equipped')
	end
end