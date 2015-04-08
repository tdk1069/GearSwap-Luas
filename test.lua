function get_sets() 
	sets.Idle= {head="Xux Hat"}
	sets.Regen = {head="Savant's Bonnet +2"}
	sets.Precast = {head="Zelus tiara"}
end

function precast(spell)
		equip(sets.Precast)
end

function midcast(spell)
		equip(sets.Regen)
end

function aftercast(spell)
	equip(sets.Idle)
    send_command('@input /recast "'..spell.english..'"')
end
