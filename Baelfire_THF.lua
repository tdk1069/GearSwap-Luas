function get_sets()				
	sets.TP = {main="Atoyac",sub="Aphotic Kukri",range="Aliyat Chakram",head="Uk'uxkaj Cap",
		body="Thaumas Coat",hands="Asn. Armlets +2",legs="Quiahuiz Trousers",feet="Raid. Poulaines +2",
		neck="Asperity Necklace",waist="Twilight belt",left_ear="Steelflash Earring",right_ear="Bladeborn Earring",
		left_ring="Candent Ring",right_ring="Epona's Ring",back="Canny Cape",}

	sets.DT={main="Atoyac",sub="Aphotic Kukri",range="Aliyat Chakram",head="Uk'uxkaj Cap",
		body="Iuitl Vest",hands="Asn. Armlets +2",legs="Quiahuiz Trousers",feet="Iuitl gaiters",
		neck="Twilight Torque",waist="Twilight belt",left_ear="Steelflash Earring",right_ear="Bladeborn Earring",
		left_ring="Dark Ring",right_ring="Dark Ring",back="Canny Cape",}	

	sets.precast = {}
	sets.precast['Exenterator'] = {body="Iuitl Vest", feet="Iuitl gaiters",waist="Sveltesse Gouriz"}
	
	send_command('@bind ![ gs equip sets.TP')
	send_command('@bind !] gs equip sets.DT')
		
end

function precast(spell)
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.TP)
	elseif new == 'Engaged' then
		equip(sets.TP)
	end
end

function aftercast(spell)
	equip(sets.TP)
end
