function get_sets() 
	sets.precast = {}
	
	sets.precast['FastCast'] = {head="Nahtirah Hat",body="Anhur Robe",
    hands="Carapacho Cuffs",legs="Artsieq Hose",feet={ name="Hagondes Sabots", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+6',}},
    neck="Stone Gorget",waist="Siegel Sash",left_ear="Loquac. Earring",
    right_ear="Earthcry Earring",left_ring="Prolix Ring",right_ring="Evoker's Ring",back="Swith Cape +1",} -- Fill with gear
	
	sets.precast['Elemental Siphon'] = { main={name="Tumafyrig", augments={'Pet: Attack+7','Pet: "Mag.Atk.Bns."+7','Phys. dmg. taken -1'},},
    sub="Vox Grip",	ammo="Esper Stone +1",
    head="Con. Horn +1",
    body="Anhur Robe",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Tatsu. Sitagoromo", augments={'Phys. dmg. taken -4%','"Elemental Siphon"+20',}},
    feet="Mdk. Crackows +1",
    neck="Caller's Pendant",
    waist="Cimmerian Sash",
    left_ear="Loquac. Earring",
    left_ring="Fervor Ring",
    right_ring="Evoker's Ring",
    back="Conveyance Cape",} -- Fill with gear

	sets.precast['Mana Cede'] = {"Call. Bracers +2"}
	
	sets.BPDelay = {ammo="Seraphicaller",head="Con. Horn +1",
    body={ name="Glyphic Doublet", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    back="Samanisi Cape",} -- Fill with gear

	sets.Idle = {main="Gridarvor",sub="Oneiros Grip",ammo="Seraphicaller",
		head="Hagondes Hat",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Sangoma Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Herald's Gaiters"} -- Fill with gear
	sets.Idle['Garuda'] = {main="Vayuvata III",sub="Achaq Grip",ammo="Seraphicaller",
		head="Convoker's Horn +1",neck="Caller's Pendant",ear1="Gifted Earring",ear2="Moonshade Earring",
		body="Hagondes Coat",hands="Adhara gages",ring1="Evoker's Ring",ring2="Sangoma Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Convoker's Pigaches +1"} -- Fill with gear
	sets.Idle['Ramuh'] = {main="Apamajas III",sub="Achaq Grip",ammo="Seraphicaller",
		head="Convoker's Horn +1",neck="Caller's Pendant",ear1="Gifted Earring",ear2="Moonshade Earring",
		body="Hagondes Coat",hands="Adhara gages",ring1="Evoker's Ring",ring2="Sangoma Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Convoker's Pigaches +1"} -- Fill with gear
	sets.Idle['Other'] = {main="Gridarvor",sub="Achaq Grip",ammo="Seraphicaller",
		head="Wivre hairpin",neck="Caller's Pendant",ear1="Gifted Earring",ear2="Moonshade Earring",
		body="Hagondes Coat",hands="Adhara gages",ring1="Evoker's Ring",ring2="Sangoma Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Convoker's Pigaches +1"} -- Fill with gear


	sets.Idle['Avatars Favor'] = {head="Buremte Hat"}
		
	Cure_spells = S{'Cure','Cure II','Cure III','Cure IV','Cure V','Curaga','Curaga II','Curaga III','Curaga IV','Curaga V'}
	na_spells = S{'Poisona','Paralyna','Blindna','Silena','Cursna','Viruna','Stona','Esuna','Erase'}
	
	BP_Enfeebles = T{'Diamond Storm','Lunar Cry','Lunar Roar','Nightmare','Pavor Nocturnus','Shock Squall','Sleepga','Slowga','Somnolence','Tidal Roar','Ultimate Terror'}
	
	BP_Magical = S{'Aerial Blast','Diamond Dust','Earthen Fury','Flaming Crush','Geocrush','Grand Fall','Heavenly Strike','Holy Mist','Howling Moon','Inferno','Judgment Bolt','Lunar Bay','Meteor Strike','Nether Blast','Night Terror','Ruinous Omen','Searing Light','Thunderspark','Thunderstorm','Tidal Wave','Wind Blade','Zantetsuken',
		'Stone II','Stone IV','Aero II','Aero IV','Water II','Water IV','Fire II','Fire IV','Thunder II','Thunder IV','Blizzard II','Blizzard IV'}

	sets.midcast = {}
	sets.midcast['na'] = {main={name="Arka II", augments={'Light Affinity: Magic Accuracy+6 Light Affinity: Recast time-14%','Light Affinity: Magic Damage+1',}},
    sub="Vivid Strap",
    ammo="Seraphicaller",
    head="Nahtirah Hat",
    body="Anhur Robe",
    hands="Con. Bracers",
    legs={ name="Artsieq Hose", augments={'MP+14','Mag. Acc.+12','MND+2',}},
    feet="Chelona Boots +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    back="Swith Cape +1",} -- Fill with gear
	
	sets.midcast['Cure'] = {main="Tamaxchi",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+5',}},
    ammo="Seraphicaller",
    head="Nahtirah Hat",
    body="Heka's Kalasiris",
    hands={ name="Bokwus Gloves", augments={'Mag. Acc.+9','MND+7','INT+3',}},
    legs={ name="Artsieq Hose", augments={'MP+14','Mag. Acc.+12','MND+2',}},
    feet="Chelona Boots +1",
    neck="Orunmila's Torque",
    waist="Acerbic Sash +1",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    back="Swith Cape +1",} -- Fill with gear
	
	sets.midcast['Stoneskin'] = {main={name="Tumafyrig", augments={'Pet: Attack+7','Pet: "Mag.Atk.Bns."+7','Phys. dmg. taken -1',}},
    sub="Vivid Strap",ammo="Seraphicaller",head="Nahtirah Hat",body="Anhur Robe",
    hands="Carapacho Cuffs",legs="Shedir Seraweels",feet={ name="Hagondes Sabots", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+6',}},
    neck="Stone Gorget",waist="Siegel Sash",left_ear="Loquac. Earring",
    right_ear="Earthcry Earring",left_ring="Prolix Ring",right_ring="Evoker's Ring",back="Swith Cape +1",}	-- Fill with gear
	
	sets.midcast['Haste'] = { main={name="Vayuvata II", augments={'Wind Affinity: Magic Accuracy+6 Wind Affinity: Recast time-14%','Wind Affinity: Magic Damage+1',}},
    sub="Vivid Strap",
    ammo="Seraphicaller",
    head="Nahtirah Hat",
    body="Anhur Robe",
    hands="Con. Bracers",
    legs={ name="Artsieq Hose", augments={'MP+14','Mag. Acc.+12','MND+2',}},
    feet="Chelona Boots +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    back="Swith Cape +1",} -- Fill with gear
	
	sets.midcast['Pet_Enfeeble'] = {main={name="Tumafyrig", augments={'Pet: Attack+7','Pet: "Mag.Atk.Bns."+7','Phys. dmg. taken -1',}},
    sub="Vox Grip",ammo="Seraphicaller",head="Con. Horn +1",body="Con. Doublet +1",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Mdk. Crackows +1",neck="Caller's Pendant",waist="Cimmerian Sash",left_ear="Gifted Earring",
    right_ear="Loquac. Earring",left_ring="Fervor Ring",right_ring="Evoker's Ring",back="Samanisi Cape",} -- Fill with gear
	sets.midcast['Pet_Buff'] = {main={name="Tumafyrig", augments={'Pet: Attack+7','Pet: "Mag.Atk.Bns."+7','Phys. dmg. taken -1',}},
    sub="Vox Grip",ammo="Seraphicaller",head="Con. Horn +1",body="Anhur Robe",hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Mdk. Shalwar +1",feet="Mdk. Crackows +1",neck="Caller's Pendant",waist="Cimmerian Sash",left_ear="Gifted Earring",
    right_ear="Loquac. Earring",left_ring="Fervor Ring",right_ring="Evoker's Ring",back="Conveyance Cape",} -- Fill with gear

	sets.midcast['Flaming Crush'] = {{ name="Tumafyrig", augments={'Pet: Attack+7','Pet: "Mag.Atk.Bns."+7','Phys. dmg. taken -1',}},
    sub="Vox Grip",
    ammo="Seraphicaller",
    head="Con. Horn +1",
    body="Con. Doublet +1",
    hands="Glyphic Bracers",
    legs={ name="Glyphic Spats", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Con. Pigaches +1",
    neck="Eidolon Pendant +1",
    waist="Cimmerian Sash",
    left_ear="Loquac. Earring",
    right_ear="Andoaa Earring",
    left_ring="Fervor Ring",
    right_ring="Evoker's Ring",
    back="Samanisi Cape",} -- Fill with gear
	
	sets.midcast['Windblade'] = {} -- Fill with gear
	sets.midcast['Thunderstorm'] = {} -- Fill with gear
	sets.midcast['Heavenly Strike'] = {} -- Fill with gear
	sets.midcast['BP_Magical'] = {main={name="Keraunos", augments={'Pet: "Mag.Atk.Bns."+13','Pet: Phys. dmg. taken -3%',}},
    sub="Vox Grip",ammo="Seraphicaller",head="Con. Horn +1",body="Con. Doublet +1",hands="Adhara Gages",
    legs="Caller's Spats +2",feet={ name="Hagondes Sabots", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+6',}},
    neck="Eidolon Pendant +1",waist="Cimmerian Sash",left_ear="Gifted Earring",right_ear="Loquac. Earring",
    left_ring="Fervor Ring",right_ring="Evoker's Ring",back="Samanisi Cape",} -- Fill with gear
	sets.midcast['BP_Physical'] = {main={name="Tumafyrig", augments={'Pet: Attack+7','Pet: "Mag.Atk.Bns."+7','Phys. dmg. taken -1',}},
    sub="Vox Grip",ammo="Seraphicaller",head="Con. Horn +1",body="Con. Doublet +1",hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Con. Spats +1",feet="Con. Pigaches +1",neck="Caller's Pendant",waist="Mujin Obi",
    left_ear="Gifted Earring",right_ear="Loquac. Earring",left_ring="Fervor Ring",right_ring="Evoker's Ring",
    back="Conveyance Cape",} -- Fill with gear
	
	sets.midcast['Alexander-Astral'] = {} -- Fill with gear
	sets.midcast['Astral Flow'] = {} -- Fill with gear
	
end

function precast(spell)
	if spell.type == 'BloodPactRage' or spell.type == 'BloodPactWard' then
		equip(sets.BPDelay)
	elseif sets.precast[spell.english] then
		equip(sets.precast[spell.english]) -- will equip for Siphon 
	else
		equip(sets.precast['FastCast'])
	end	
end

function pet_midcast(spell)
	if buffactive['Astral Flow'] then
		if spell.english == 'Alexander' then
			equip(sets.midcast['Alexander-Astral'])
		else
			equip(sets.midcast['Astral Flow'])
		end
	elseif spell.type=='BloodPactWard' then
		if BP_Enfeebles:contains(spell.name) then
			equip(sets.midcast['Pet_Enfeeble'])
		else
			equip(sets.midcast['Pet_Buff'])
		end
	elseif spell.type=='BloodPactRage' then
		if sets.midcast[spell.english] then
			equip(sets.midcast[spell.english])
		elseif BP_Magical:contains(spell.name) then
			equip(sets.midcast['BP_Magical'])
		else
			equip(sets.midcast['BP_Physical'])
	end

	end
end

function midcast(spell)
	if na_spells:contains(spell.english) then -- Check if casting a *NA spell
		equip(sets.midcast['na'])
	elseif Cure_spells:contains(spell.english) then -- Check if casting a Cure* Spell
		equip(sets.midcast['Cure'])
	elseif sets.midcast[spell.english] then -- check for Haste/Stoneskin
		equip(sets.midcast[spell.english])
	end
end

function aftercast(spell)
	if pet.isvalid then
		if sets.Idle[pet.name] then
			if buffactive["Avatar's Favor"] then
				equip(set_combine(sets.Idle[pet.name],sets.Idle['Avatars Favor'])) -- Use an idle set named after avatar or ...
			else
				equip(sets.Idle[pet.name]) -- Use an idle set named after avatar or ...
				windower.add_to_chat(1,pet.name .. " idle")
			end
		else
			if buffactive["Avatar's Favor"] then
				equip(set_combine(sets.Idle['Other'],sets.Idle['Avatars Favor'])) -- Use an idle set named after avatar or ...
				windower.add_to_chat(1,"Favor General Pet")
			else
				equip(sets.Idle['Other']) -- Use an idle set named after avatar or ...
			end
		end
	else
		equip(sets.Idle)
	end
end

function status_change(new,old)
end