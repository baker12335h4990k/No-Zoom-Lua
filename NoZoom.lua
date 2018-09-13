local client_set_event_callback  = client.set_event_callback

local set_prop                   = entity.set_prop
local get_prop                   = entity.get_prop
local get_local_player           = entity.get_local_player
local get_weapon				 = entity.get_player_weapon

local ui_get                     = ui.get
local ui_set                     = ui.set
local ui_newcheckbox             = ui.new_checkbox

--{Change "dfov" to your preferred fov extension}--
local dfov                       = 80
local nozoom_toggle	             = ui_newcheckbox("VISUALS", "Effects", "No Zoom")
local firstzoom_toggle           = ui_newcheckbox("VISUALS", "Effects", "No First Zoom")

 
local function on_paint(ctx)
	local local_player   = get_local_player()
	local fov            = get_prop(local_player, "m_iFOV")       
	
--[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]	

	if ( ui_get(nozoom_toggle)) then		
					
		if (fov == 15) then
			set_prop(local_player, "m_iDefaultFOV", 15)	
			return
		end
		
		if (fov == 40) then
			set_prop(local_player, "m_iDefaultFOV", 40)
			return
		end 
			
				
		if (fov == dfov) then
			set_prop(local_player, "m_iDefaultFOV", dfov)
			return
		end

	end
	
--[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]	

	if ( ui_get(firstzoom_toggle)) then		
					
		if (fov == 15) then
			set_prop(local_player, "m_iDefaultFOV", dfov)	
			return
		end
		
		if (fov == 40) then
			set_prop(local_player, "m_iDefaultFOV", 40)
			return
		end 
			
				
		if (fov == dfov) then
			set_prop(local_player, "m_iDefaultFOV", dfov)
			return
		end

	end
	
--[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]	
						
	
	set_prop(local_player, "m_iDefaultFOV", dfov)
	
end

client_set_event_callback("paint", on_paint)