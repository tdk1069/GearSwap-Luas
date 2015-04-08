include('organizer-lib.lua')

function get_sets()				
	sets.TP={
		main="Buramenk'ah",
		sub="Gabaxorea",
		ammo="Honed Tathlum",
		head="Uk'uxkaj Cap",
		body="Qaaxo harness",
		hands="Taeon Gloves",
		legs="Ighwa Trousers",
		feet="Taeon boots",
		neck="Asperity Necklace",
		waist="Windbuffet belt +1",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Candent Ring",
		right_ring="Epona's Ring",
		back="Cornflower Cape"}
		
	sets.ACC={
		ammo="Honed Tathlum",
		body="Luhlaza Jubbah",
		legs="Ighwa Trousers",
		back="Letalis Mantle",
		hands="Buremte Gloves",
		feet="Assim. Charuqs"
	}

		sets.DT={
		neck="Twilight Torque",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Iximulew cape",
		waist="Flume Belt"}

		
		
		sets.precast = {}
		sets.precast['Requiescat']={waist="Shadow Belt"}
		sets.precast['Chant du Cygne']={ammo="Jukukik Feather",body="Qaaxo harness",waist="Wanion Belt",ring1="Jupiter's Ring",feet="Scopuli nails +1",waist="Flame Belt",back="Letalis Mantle",hands="Buremte Gloves",legs="Manibozho Brais"}
		sets.precast['Sanguine Blade']={ammo="Erlene's Notebook",head="Hagondes Hat",legs="Hagondes Pants",feet="Hagondes sabots",body="Hagondes coat",hands="Hagondes Cuffs",ring1="Demon's Ring",
			ring2="Strendu ring",ear1="Hecate's Earring",ear2="Novio earring",neck="Eddy necklace",waist="Aswang sash",back="Cornflower Cape"}

		sets.precast['Subduction']={ammo="Erlene's Notebook",head="Hagondes Hat",legs="Hagondes Pants",feet="Hagondes sabots",body="Hagondes coat",hands="Hagondes Cuffs",ring1="Demon's Ring",
			ring2="Strendu Ring",ear1="Hecate's Earring",ear2="Novio earring",neck="Eddy necklace",back="Cornflower Cape",waist="Aswang sash"}

			
		-- Generic Physical Magic set
		sets.precast.physical = {waist="Wanion Belt",right_ring="Spiral Ring",legs="Ighwa Trousers"}
		sets.precast.magical={ammo="Erlene's Notebook",head="Hagondes Hat",legs="Hagondes Pants",feet="Hagondes sabots",body="Hagondes coat",hands="Hagondes Cuffs",ring1="Demon's Ring",
			ring2="Strendu ring",ear1="Hecate's Earring",ear2="Novio earring",neck="Eddy necklace",waist="Aswang sash",back="Cornflower Cape"}
		
		sets.aftercast = {}
		sets.aftercast.TP = sets.TP
		sets.aftercast.Idle = {head="Uk'uxkaj Cap",ring1="Sheltered Ring",legs="Blood Cuisses",ring2="Defending Ring",body="Luhlaza Jubbah"}
		sets.aftercast.IdleRefresh = {head="Wivre Hairpin",ring1="Sheltered Ring",legs="Blood Cuisses",ring2="Defending Ring"}
		sets.aftercast.IdleRefreshLow = {head="Wivre Hairpin",ring1="Sheltered Ring",legs="Blood Cuisses",ring2="Defending Ring",waist="Fucho-no-Obi"}

		-- Spell Types
		Blue_Physical = S{'Foot Kick','Power Attack','Sprout Smack','Wild Oats','Queasyshroom','Battle Dance','Head Butt','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Death Scissors','Dimensional Death','Spiral Spin','Seedspray','Body Slam','Spinal Cleave','Frenetic Rip','Frypan','Hydro Shot','Tail Slap','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Sub-zero Smash','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Benthic Typhoon','Whirl of Rage','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Sudden Lunge','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Paralyzing Triad','Glutinous Dart','Thrashing Assault','Sinker Drill'}
		
		-- Set up F-Keys
		send_command("@bind F11 input //gs c TP")
		send_command("@bind F12 input //gs c DT")
		add_to_chat(1,"F11 - TP Set")
		add_to_chat(1,"F12 - DT Set")
end

function precast(spell,action)
	if spell.type == "BlueMagic" and Blue_Physical:contains(spell.english) then
		equip(sets.precast.physical)
	elseif spell.type == "BlueMagic" then
		equip(sets.precast.magical)
	end
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
end

function aftercast(spell,action)
	if player.status =='Engaged' then
		equip(sets.aftercast.TP)
	elseif player.mpp < 50 then
		equip(sets.aftercast.IdleRefreshLow)
	elseif player.mpp < 90 then
		equip(sets.aftercast.IdleRefresh)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		if player.mpp < 50 then
		equip(sets.aftercast.IdleRefreshLow)
		elseif player.mpp < 90 then
		equip(sets.aftercast.IdleRefresh)
		else
		equip(set_combine(sets.aftercast.TP,sets.aftercast.Idle))
		end
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
	elseif command == 'HELP' then
		add_to_chat(1,"F11 - TP Set")
		add_to_chat(1,"F12 - DT Set")
	end
end
