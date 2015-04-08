function get_sets()				
	sets.TP={    main="Eminent Scimitar",
		sub="Xiutleato",
		ammo="Honed Tathlum",
		head="Espial Cap",
		body="Espial Gambison",
		hands="Espial Bracers",
		legs="Espial Hose",
		feet="Taeon Boots",
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Vehemence ring",
		right_ring="Heed Ring",
		back="Cornflower Cape",}


		sets.DT={
			neck="Twilight Torque"}

		
		
		sets.precast = {}
		sets.precast['Requiescat']={}
		sets.precast['Sanguine Blade']={
			main="Eminent Scimitar",
			sub="Xiutleato",
			ammo="Erlene's Notebook",
			head="Hagondes Hat",
			body="Hagondes Coat",
			hands="Hagondes Cuffs",
			legs="Hagondes Pants",
			feet="Hagondes Sabots",
			neck="Quanpur Necklace",
			waist="Windbuffet Belt +1",
			left_ear="Novio Earring",
			right_ear="Hecate's Earring",
			left_ring="Acumen ring",
			right_ring="Strendu ring",
			back="Cornflower Cape",
		}		
		sets.precast['Subduction']=sets.precast['Sanguine Blade']
		
		-- Generic Physical Magic set
		sets.precast.physical = {}
		
		sets.aftercast = {}
		sets.aftercast.TP = sets.TP
		sets.aftercast.Idle = {ring1="Sheltered Ring",legs="Blood Cuisses"}

		-- Spell Types
		Blue_Physical = S{'Foot Kick','Power Attack','Sprout Smack','Wild Oats','Queasyshroom','Battle Dance','Head Butt','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Death Scissors','Dimensional Death','Spiral Spin','Seedspray','Body Slam','Spinal Cleave','Frenetic Rip','Frypan','Hydro Shot','Tail Slap','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Sub-zero Smash','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Benthic Typhoon','Whirl of Rage','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Sudden Lunge','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Paralyzing Triad','Glutinous Dart','Thrashing Assault'}
		
		-- Set up F-Keys
		send_command("@bind F11 input //gs c TP")
		send_command("@bind F12 input //gs c DT")
		add_to_chat(1,"F11 - TP Set")
		add_to_chat(1,"F12 - DT Set")
end

function precast(spell,action)
	if Blue_Physical:contains(spell.english) then
		equip(sets.precast.physical)
	end
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
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
		equip(sets.TP)
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