function get_sets()
	sets.Idle = {main="Keraunos",sub="Oneiros Grip",ammo="Eminent Sachet",
		head="Convoker's Horn",neck="Caller's Pendant",ear1="Caller's Earring",ear2="Gifted Earring",
		body="Convoker's doublet",hands="Convoker's Bracers",ring1="Evoker's Ring",ring2="Fervor ring",
		back="Tiresias' Cape",waist="Cimmerian Sash",legs="Nares trews",feet="Convoker's Pigaches"}
		
	sets.Siphon = {main="Soulscourge",legs="Convoker's Spats",back="Conveyance cape",ring2="Fervor ring"}
	
	sets.Precast_BP = {ammo="Eminent Sachet",ear1="Caller's Earring",body="Convoker's doublet",
		hands="Convoker's Bracers",head="Summoner's Horn",back="Tiresias' Cape",feet="Smn. Pigaches +2"}
		
	sets.BP_Rage = set_combine(sets.Idle,{main="Balsam Staff",head="Bokwus Circlet",neck="Eidolon Pendant",hands="Nares Cuffs",
		legs="Convoker's Spats",feet="Hagondes Sabots"})
end

function aftercast(spell)
	if not spell.type or not string.find(spell.type,'BloodPact') then
		-- Don't want to swap away too quickly if I'm about to put BP damage gear on
		-- Need to wait 1 in order to allow pet information to update on Release.
		send_command('@wait 1.5;gs equip sets.Idle')
	end
end

function precast(spell)
	if spell.type=='BloodPactRage' or spell.type=='BloodPactWard' then
		equip(sets.Precast_BP)
	elseif spell.name=='Elemental Siphon' then
		equip(sets.Siphon)
	end
end

function status_change(new,old)
	if new=='Idle' then
		equip(sets.Idle)
	elseif new=='Resting' then
		equip(equip(sets.Idle))
	end
end

function pet_midcast(spell)
	if spell.name == 'Perfect Defense' then
		equip(sets.Siphon)
	elseif spell.type=='BloodPactWard' then
		equip(sets.BP_Rage)
	elseif spell.type=='BloodPactRage' then
		equip(sets.BP_Rage)
	end
end

function pet_aftercast(spell)
	equip(sets.Idle)
end