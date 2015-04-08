function get_sets()				
	sets.precast = {}
	sets.precast.Chakra = {}
	sets.precast.Counterstance = {}
	sets.precast.Dodge = {}
	sets.precast.Mantra = {}
	sets.precast.Waltz = {}
		
--	sets.precast['Victory Smite'] = {}
		
	sets.precast.WS = {main="Oatixur",ammo="Potestas Bomblet",head="Uk'uxkaj Cap",neck="faith torque",
		ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Espial gambison",hands="Anchorite's Gloves",
		ring1="Candent Ring",ring2="Epona's Ring",back="Atheling Mantle",waist="Wanion Belt",legs="Kaabnax trousers",
		feet="Otronif Boots"}
	
	sets.TP = {}
	sets.TP.DD = {main="Oatixur",ammo="Potestas Bomblet",head="Uk'uxkaj Cap",neck="Asperity necklace",
		ear1="Bladeborn Earring",ear2="Steelflash Earring",body="Qaaxo Harness",hands="Otronif Gloves",
		ring1="Rajas Ring",ring2="Epona's Ring",back="Atheling Mantle",waist="Wanion Belt",legs="Kaabnax trousers",
		feet="Otronif Boots"}
		
	sets.DT = set_combine(sets.TP.DD,{neck="twilight torque",body="Qaaxo Harness",ring1="Defending ring",
		ring2="Dark Ring",back="Iximulew cape",waist="Black Belt"})

	sets.ACC = {body="Qaaxo Harness", ammo="Honed tathlum", back="Anchoret's mantle",legs="Kaabnax Trousers"}
				
	sets.aftercast = {}
	sets.aftercast.Idle = {ring1="Sheltered Ring",feet="Herald's Gaiters"}
	sets.aftercast.TP = sets.TP.DD
	
	windower.send_command('@bind f12 gs c DT')
	windower.send_command('@bind f11 gs c swaptp')
	tpmode = 'tp'
	add_to_chat(10,'==F11== swaps TP and Accuracy sets')
	add_to_chat(10,'==F12== Sets max DT')

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
		add_to_chat(10,'==DT== Set Equipped')
	elseif command == 'TP' then
		tpmode = 'tp';
		sets.aftercast.TP = sets.TP.DD
		equip(sets.aftercast.TP)
		add_to_chat(10,'==TP== Set Equipped')
	elseif command == 'ACC' then
		tpmode = 'acc'
		sets.aftercast.TP = set_combine(sets.aftercast.TP,sets.ACC)
		equip(sets.aftercast.TP)
		add_to_chat(10,'==ACC== Set Equipped')
	elseif command == 'SWAPTP' then
		if tpmode == 'acc' then
			send_command('@gs c tp')
		elseif tpmode == 'tp' then
			send_command('@gs c acc')
		end
	end
end