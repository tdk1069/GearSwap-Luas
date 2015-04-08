function get_sets() 
	sets.magic = {}
	
	sets.magic['Elemental Magic'] = {
    main="Keraunos",
    sub="Oneiros Grip",
    ammo="Erlene's Notebook",
    head="Buremte Hat",
    body={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+19',}},
    hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+10',}},
    legs={ name="Hagondes Pants", augments={'Phys. dmg. taken -1%','Mag. Acc.+20',}},
    feet={ name="Hagondes Sabots", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+18',}},
    neck="Stoicheion Medal",
    waist="Searing Sash",
    left_ear="Hecate's Earring",
    right_ear="Novio Earring",
    left_ring="Strendu Ring",
    right_ring={ name="Demon's Ring", augments={'"Mag.Atk.Bns."+3','"Resist Curse"+2','"Resist Blind"+2',}},
    back="Bookworm's Cape"}
		
	sets.magic['Healing Magic'] = {}

	sets.Idle= {
    main="Keraunos",
    sub="Oneiros Grip",
    ammo="Erlene's Notebook",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Dark resistance+5','Ice resistance+8',}},
    body={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+19',}},
    hands="Serpentes Cuffs",
    legs={ name="Hagondes Pants", augments={'Phys. dmg. taken -1%','Mag. Acc.+20',}},
    feet="Herald's Gaiters",
    neck="Stoicheion Medal",
    waist="Searing Sash",
    left_ear="Hecate's Earring",
    right_ear="Novio Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
    right_ring="Defending Ring",
    back="Bookworm's Cape"}

	sets.Regen = {	}

	sets.FastCast = {
		}

	sets.Haste = {
		}
		
end

function precast(spell)
    if spell.action_type == 'Magic' then
		equip(sets.FastCast)
    end
end

function midcast(spell)
--		equip(sets.Regen)
	if string.find(spell.english,'Regen') then
		equip(sets.Regen)
	elseif sets.magic[spell.skill] then
		equip(sets.magic[spell.skill])
	end
end

function aftercast(spell)
	equip(sets.Idle)
--    send_command('@input /recast "'..spell.english..'"')
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle)
	elseif new == 'Engaged' then
		equip(sets.aftercast.TP)
	end
end


