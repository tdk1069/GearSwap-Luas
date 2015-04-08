function get_sets()				

    sets.precast = {}
	sets.aftercast = {}

    sets.precast.Waltz = {head="Goblin Masque"} -- Any Waltz stuff (CHR mod)
	sets.precast.Reward = {main="Zoraal Ja's Axe",sub="Pallas's Shield",head="Bison Warbonnet",
		neck="Justice Badge",hands="Ogre Gloves",body="Kirin's Osode",waist="Crudelis Belt",
		back="Royal Army Mantle",ring1="Solemn Ring",ring2="sirona's Ring",legs="Magic Cuisses",
		ear1="ferine earring",ear2="Communion Earring",feet="monster gaiters"} -- Reward gear here.
		
	sets.precast.Ninjutsu = {neck="Magoraga Beads",ear1="Loquacious Earring",hands="Thaumas Gloves"} -- Example Nin fastcast stuff 
    sets.precast['Cloudsplitter'] = {} -- Special set for Cloudsplitter
    sets.precast['Ruinator'] = {} -- Special set for Ruinator
    sets.precast.WS = {} -- All other WS's General set
	
	sets.aftercast.TP = {} -- TP Gear to be used as soon as engaged.
	sets.aftercast.Idle = {ring1="Sheltered Ring",feet="Herald's Gaiters"} -- Any idle gear, speed+, Regen, Refresh etc.
	
end

function precast(spell)
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english]) -- This handles specific ws sets
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

function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.aftercast.TP) -- Puts you in TP set after a spell if still engaged on target
    else
        equip(sets.aftercast.Idle) -- Puts you in TP set after a spell if not engaged.
    end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.aftercast.Idle) -- Will change you into Idle gear as soon as you idle,rest,disengage
	elseif new == 'Engaged' then
		equip(sets.aftercast.TP)  -- Will change you into TP set as soon as you engage.
	end
end