function get_sets()				
	sets.Idle = {main="Atoyac",
    range="Mollfrith",
    head="Uk'uxkaj Cap",
    body="Orion Jerkin",
    hands="Manibozho Gloves",
    legs="Aetosaur trousers",
    feet="Scopuli Nails +1",
    neck="Ocachi Gorget",
    waist="Elanid Belt",
    left_ear="Matanki Earring",
    right_ear="Clearview Earring",
    left_ring="Warp Ring",
    right_ring="Hajduk Ring",
    back="Lutian Cape"}
	
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle)
	elseif new == 'Engaged' then
		equip(sets.Idle)
	end
end

