function get_sets() 
	sets.precast = {}
	sets.precast['Benediction'] = {
	body="Piety Briault"
	}

	sets.precast['FastCastCure']={
    main="Tamaxchi",sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+5',}},
    ammo="Incantor Stone",head={ name="Gende. Caubeen", augments={'Phys. dmg. taken -3%','"Cure" spellcasting time -3%',}},
    body="Heka's Kalasiris",hands={ name="Gendewitha Gages", augments={'Phys. dmg. taken -3%',}},legs="Orsn. Pantaln. +2",
    feet="Chelona Boots +1",neck="Aceso's Choker",waist="Ninurta's Sash",left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},
    right_ear="Loquac. Earring",left_ring="Prolix Ring",right_ring="Paguroidea Ring",back="Swith Cape +1",
	}

	sets.precast['Normal'] = {main="Terra's Staff",ammo="Incantor Stone",
	head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquacious Earring",
	body="Anhur robe",hands="Gendewitha Gages",ring1="Prolix Ring",
	back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}	
	
	sets.midcast = {}
	sets.midcast['Cursna'] = {
    main={ name="Arka II", augments={'Light Affinity: Magic Accuracy+6 Light Affinity: Recast time-14%','Light Affinity: Magic Damage+1',}},
    sub="Arbuda Grip",ammo="Impatiens",head="Nahtirah Hat",body="Anhur Robe",hands="Hieros Mittens",legs="Theo. Pant. +1",
    feet="Gende. Galoshes",neck="Malison Medallion",waist="Witful Belt",
	left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},
    right_ear="Loquac. Earring",left_ring="Prolix Ring",right_ring="Haoma's Ring",back="Swith Cape +1",
	}

	na_spells = S{'Poisona','Paralyna','Blindna','Silena','Cursna','Viruna','Stona','Esuna'}
	sets.midcast['na'] = {
    main={ name="Arka II", augments={'Light Affinity: Magic Accuracy+6 Light Affinity: Recast time-14%','Light Affinity: Magic Damage+1',}},
    sub="Arbuda Grip",ammo="Hasty Pinion +1",head="Nahtirah Hat",body="Anhur Robe",hands="Blessed Mitts +1",legs="Orsn. Pantaln. +2",
    feet="Chelona Boots +1",neck="Orunmila's Torque",waist="Ninurta's Sash",
	left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},
    right_ear="Loquac. Earring",left_ring="Prolix Ring",right_ring="Paguroidea Ring",back="Swith Cape +1",
	}
	
	Cure_spells = S{'Cure','Cure II','Cure III','Cure IV','Cure V','Curaga','Curaga II','Curaga III','Curaga IV','Curaga V'}
	sets.midcast['Cure'] = {
	main="Tamaxchi",sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+5',}},
    ammo="Incantor Stone",head={ name="Gende. Caubeen", augments={'Phys. dmg. taken -3%','"Cure" spellcasting time -3%',}},
    body="Orison Bliaud +2",hands="Theophany Mitts",legs="Orsn. Pantaln. +2",feet={ name="Piety Duckbills", augments={'Enhances "Protectra V" effect',}},
    neck="Colossus's Torque",waist="Bishop's Sash",left_ear="Beatific Earring",right_ear="Roundel Earring",left_ring="Haoma's Ring",
    right_ring="Sirona's Ring",back="Altruistic Cape",
	}

	Regen_spells = S{'Regen','Regen II','Regen III','Regen IV'}
	sets.midcast['Regen'] = {
    main={ name="Arka II", augments={'Light Affinity: Magic Accuracy+6 Light Affinity: Recast time-14%','Light Affinity: Magic Damage+1',}},sub="Arbuda Grip",
    ammo="Impatiens",head="Nabu's Tiara",body={ name="Piety Briault", augments={'Enhances "Benediction" effect',}},hands="Orison Mitts +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},feet="Chelona Boots +1",neck="Orunmila's Torque",
    waist="Witful Belt",left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},right_ear="Loquac. Earring",
    left_ring="Prolix Ring",right_ring="Haoma's Ring",back="Swith Cape +1",
	}

	Barelement_spells = S{'Barstonra','Barwatera','Barfira','Barthundra','Barblizzara','Baraera'}
	sets.midcast['Barelement'] = {
    main="Beneficus",sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+5',}},ammo="Impatiens",
    head="Orison Cap +2",body="Orison Bliaud +2",hands="Orison Mitts +2",legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Orsn. Duckbills +2",neck="Colossus's Torque",waist="Olympus Sash",left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},
    right_ear="Loquac. Earring",left_ring="Prolix Ring",right_ring="Haoma's Ring",back="Merciful Cape",
	}


	Barstatus_spells = S{'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barvira','Barpetra','Baramnesra'}
	sets.midcast['Barstatus'] = {
    main="Beneficus",sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -7%','Mag. Acc.+5',}},ammo="Impatiens",
	head="Nabu's Tiara",body="Anhur Robe",hands="Ayao's Gages",legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Orsn. Duckbills +2",neck="Colossus's Torque",waist="Olympus Sash",left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},
    right_ear="Loquac. Earring",left_ring="Prolix Ring",right_ring="Haoma's Ring",back="Merciful Cape",
	}

	sets.Idle = {main="Terra's Staff", sub="Oneiros grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Moonshade Earring",ear2="Loquacious Earring",
		body="Theo. Briault",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Herald's Gaiters"}

	
end

function precast(spell)
	if Cure_spells:contains(spell.english) then
		equip(sets.precast['FastCastCure'])
	else
		equip(sets.precast['Normal'])
    end
end

function midcast(spell)
	if na_spells:contains(spell.english) then
		if buffactive['Divine Caress'] then
			equip(sets.midcast['na'])
		else
			equip(sets.midcast['na'],{hands="Orison Mitts +2"})
		end
	elseif Cure_spells:contains(spell.english) then
		equip(sets.midcast['Cure'])
	elseif Regen_spells:contains(spell.english) then
		equip(sets.midcast['Regen'])
	elseif Barelement_spells:contains(spell.english) then
		equip(sets.midcast['Barelement'])
	elseif Barstatus_spells:contains(spell.english) then
		equip(sets.midcast['Barstatus'])
	end
end

function aftercast(spell)
	if player.mpp < 90 then
		equip(sets.Idle,{head="Wivre Hairpin"})
	else
		equip(sets.Idle)
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle)
	end
end


