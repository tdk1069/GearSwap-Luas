function get_sets()				

    sets.precast = {}
    sets.midcast = {}
	sets.aftercast = {}
    sets.buff = {}

    sets.precast.Waltz = {}
	sets.precast.Reward = {}		
	sets.precast.Repair={
		left_ear="Guignol Earring",}	
	
	sets.precast.Ninjutsu = {
		neck="Magoraga Beads",
		ear1="Loquacious Earring",
		hands="Thaumas Gloves"} -- Example Nin fastcast stuff 
	
	sets.precast['Stringing Pummel']={
		main="Oatixur",
		head="Uk'uxkaj Cap",
		body="Wayfarer Robe",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Asperity Necklace",
		waist="Wanion belt",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Candent ring",
		right_ring="Epona's Ring",
		back="Dispersal Mantle",}
    
	sets.precast.WS = sets.precast['Stringing Pummel']
	
	sets.TP = {    
		main="Oatixur",
		range="Em. Animator",
		ammo="Automat. Oil +3",
		head="Uk'uxkaj Cap",
		body="Thaumas Coat",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Asperity Necklace",
		waist="Kuku Stone",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Candent ring",
		right_ring="Epona's Ring",
		back="Dispersal Mantle",}

	sets.DT={
		main="Oatixur",
		range="Em. Animator",
		ammo="Automat. Oil +3",
		head="Uk'uxkaj Cap",
		body="Wayfarer Robe",
		hands="Otronif Gloves",
		legs="Otronif Brais",
		feet="Otronif Boots",
		neck="Twilight Torque",
		waist="Kuku Stone",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Dark Ring",
		right_ring="Defending Ring",
		back="Shadow Mantle",}

	sets.aftercast.TP = sets.TP	
	
	sets.aftercast.Idle = set_combine(sets.aftercast.TP,{ring1="Sheltered Ring",feet="Hermes' Sandals"})
	sets.aftercast.Town = {} -- Town gear!
	
	areas = {}
	areas.Cities = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters",
		"Windurst Woods","Windurst Walls","Heavens Tower","Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
		"Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate","Tavanazian Safehold",
		"Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham"}

	show_spell_info = false
	
	send_command("bind F12 gs c tpmode")
	send_command("@input /echo >>> F12 Toggles TP mode between TP/DT")
end

function precast(spell)
	if show_spell_info then 
		spell_info(spell)
	end
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english]) -- This handles specific named abilities precast.JA or WS ie sets.precast.Reward sets.precast.Repair sets.precast['Victory Smite']
    elseif spell.type=="WeaponSkill" then
        equip(sets.precast.WS) -- This is any other weaponskill and puts general set on
    elseif string.find(spell.english,'Waltz') then
        equip(sets.precast.Waltz)
    elseif string.find(spell.english,'Reward') then
        equip(sets.precast.Reward)
    elseif spell.type == 'Ninjutsu' then
        equip(sets.precast.Ninjutsu) -- If casting nin spell and casting time longer than 1 second use this.
    end
end

function midcast(spell)
end

function spell_info(spell)
	if spell.english then
		print("Name ["..spell.english.."]")
	end
	if spell.type then
		print("Type ["..spell.type.."]")
	end
	if spell.skill then
		print("Skill ["..spell.skill.."]")
	end
	if spell.element then
		print("SpellElement ["..spell.element.."]")
	end
	if spell.cast_time then
		print("Cast_Time ["..spell.cast_time.."]")
	end
end

function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.aftercast.TP) -- Puts you in TP set after a spell if still engaged on target
    else
        equip(sets.aftercast.Idle) -- Puts you in TP set after a spell if not engaged.
    end
end

function status_change(new,old)
	gearcheck()
end

function gearcheck()
    if player.status =='Engaged' then
        equip(sets.aftercast.TP)
	elseif areas.Cities:contains(world.area) then
        equip(sets.aftercast.Town)
	else
        equip(sets.aftercast.Idle)
    end
	-- 	

end

function self_command(command)
    if command:lower() == 'tpmode' then
        if sets.aftercast.TP == sets.TP then
            sets.aftercast.TP = sets.DT
            send_command('@input /echo >>TP set: DT')
        elseif sets.aftercast.TP == sets.DT then
            sets.aftercast.TP = sets.TP
            send_command('@input /echo >>TP set: TP')
        end
	elseif command:lower() == 'spellinfo' then
		if show_spell_info == true then
			send_command('@input /echo Hiding Spell Info')
			show_spell_info = false
		else
			send_command('@input /echo Showing Spell Info')
			show_spell_info = true
		end
    end
	gearcheck()
end
