function get_sets()				
	sets.TP={
		main="Azukinagamitsu",
		sub="Rose Strap",
		ammo="Potestas Bomblet",
		head="Wakido Kabuto",
		body="Karieyh Haubert +1",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Asperity Necklace",
		waist="Wanion Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Spiral Ring",
		back="Takaha Mantle",}

		sets.DT={
		neck="Twilight Torque",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Iximulew cape"}

		
		
		sets.precast = {}
		sets.precast['']={}
		sets.precast['Meditate']={head="Wakido Kabuto"}

		sets.aftercast = {}
		sets.aftercast.TP = sets.TP
		sets.aftercast.Idle = {ring1="Sheltered Ring",ring2="Defending Ring"}
	
	-- Set up F-Keys
	send_command("@bind F11 input //gs c TP")
	send_command("@bind F12 input //gs c DT")
	add_to_chat(1,"F11 - TP Set")
	add_to_chat(1,"F12 - DT Set")
end

function precast(spell,action)
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
end

function aftercast(spell,action)
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


function self_command(command)
	command = string.upper(command)
	if command == 'DT' then
		sets.aftercast.TP = sets.DT
		equip(sets.aftercast.TP)
		send_command('@input /echo DT Set Equipped')
	elseif command == 'TP' then
		sets.aftercast.TP = sets.TP
		equip(sets.aftercast.TP)
		send_command('@input /echo TP Set Equipped')
	elseif command == 'ACC' then
		sets.aftercast.TP = set_combine(sets.aftercast.TP,sets.ACC)
		equip(sets.aftercast.TP)
		send_command('@input /echo ACC Set Equipped')
	end
end