function get_sets()				
	sets.precast = {}
	sets.precast.Reward = {    main="Kumbhakarna",
    sub="Hunahpu",
    ammo="Jukukik Feather",
    head="Quiahuiz Helm",
    body="Iuitl Vest",
    hands="Ogre Gloves",
    legs="Iuitl Tights",
    feet={ name="Mst. Gaiters +2", augments={'Enhances "Beast Healer" effect',}},
    neck="Faith Torque",
    waist="Windbuffet Belt +1",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Solemn Ring",
    right_ring="Sirona's Ring",
    back="Pastoralist's Mantle",
}
		
		
	sets.precast.WS = {}
	sets.precast['Cloudsplitter'] = {    main="Kumbhakarna",
    sub="Hunahpu",
    ammo="Erlene's Notebook",
    head="Otomi Helm",
    body="Xaddi Mail",
    hands="Buremte Gloves",
    legs="Iuitl Tights",
    feet="Ejekamal Boots",
    neck="Stoicheion Medal",
    waist="Windbuffet Belt +1",
    left_ear="Novio Earring",
    right_ear="Hecate's Earring",
    left_ring="Candent Ring",
    right_ring="Epona's Ring",
    back="Letalis Mantle",}
	
	sets.TP = {}
	sets.TP.DD = {    main="Kumbhakarna",
    sub="Hunahpu",
    ammo="Jukukik Feather",
    head="Otomi Helm",
    body="Xaddi mail",
    hands="Buremte Gloves",
    legs="Iuitl Tights",
    feet="Ejekamal boots",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Candent Ring",
    right_ring="Epona's Ring",
    back="Letalis Mantle",}

	
	sets.DT = set_combine(sets.TP.DD,{neck="twilight torque",ring1="Defending ring",
		ring2="Dark Ring",back="Iximulew cape"})

	sets.ACC = {}
				
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