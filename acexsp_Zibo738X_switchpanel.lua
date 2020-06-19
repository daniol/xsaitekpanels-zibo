--[[
	Zibo Boeing 737-800
	Version: 1.12
--]]
if PLANE_ICAO == "B738" then
    
    local function sleep(n)
        local t0 = os.clock()
        while os.clock() - t0 <= n do end
    end
    
	-- ************************************************************************************************************************************************************************************************
	-- GLOBAL VARIABLES
	AceXSP_Version = "1.12"
	
	-- Global datarefs
	dataref("XSP_FNBUTTON", "bgood/xsaitekpanels/fnbutton/status", "readonly")
	
	-- Switch datarefs
	dataref("ZIBO_AUTOBRAKE_POS", "laminar/B738/autobrake/autobrake_pos", "readonly")
	dataref("ZIBO_IRS_LEFT", "laminar/B738/toggle_switch/irs_left", "readonly")
	dataref("ZIBO_IRS_RIGHT", "laminar/B738/toggle_switch/irs_right", "readonly")
	dataref("ZIBO_FUEL_LEFT1", "laminar/B738/fuel/fuel_tank_pos_lft1", "readonly")
	dataref("ZIBO_FUEL_LEFT2", "laminar/B738/fuel/fuel_tank_pos_lft2", "readonly")
	dataref("ZIBO_FUEL_RIGHT1", "laminar/B738/fuel/fuel_tank_pos_rgt1", "readonly")
	dataref("ZIBO_FUEL_RIGHT2", "laminar/B738/fuel/fuel_tank_pos_rgt2", "readonly")
	dataref("ZIBO_FUEL_CENTER1", "laminar/B738/fuel/fuel_tank_pos_ctr1", "readonly")
	dataref("ZIBO_FUEL_CENTER2", "laminar/B738/fuel/fuel_tank_pos_ctr2", "readonly")
        
        dataref("ZIBO_BAT_COVER_POSITION", "laminar/B738/button_switch/cover_position", "readonly", 2)
		
	-- ************************************************************************************************************************************************************************************************
	-- PROGRAM START

	logMsg ( "AceXSP: ** Starting AceXSP_Zibo738X SWITCHPANEL version "..AceXSP_Version.." **" )
		
	-- ************************************************************************************************************************************************************************************************
	-- SWITCHPANEL COMMANDS
	
	-- Starter - Autobrake
	function AceXSP_Switch_Starter_Off()					-- RTO
		if (ZIBO_AUTOBRAKE_POS ~= 0) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_Off", "Switch_Starter_Off", "AceXSP_Switch_Starter_Off()", "", "")
	function AceXSP_Switch_Starter_R()						-- OFF
		if (ZIBO_AUTOBRAKE_POS ~= 1) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_R", "Switch_Starter_R", "AceXSP_Switch_Starter_R()", "", "")
	function AceXSP_Switch_Starter_L()						-- 1
		if (ZIBO_AUTOBRAKE_POS ~= 2) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_L", "Switch_Starter_L", "AceXSP_Switch_Starter_L()", "", "")
	function AceXSP_Switch_Starter_Both()					-- 2
		if (ZIBO_AUTOBRAKE_POS ~= 3) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_Both", "Switch_Starter_Both", "AceXSP_Switch_Starter_Both()", "", "")
	function AceXSP_Switch_Starter_Start()					-- 3
		if (ZIBO_AUTOBRAKE_POS ~= 4) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_Start", "Switch_Starter_Start", "AceXSP_Switch_Starter_Start()", "", "")

	function AceXSP_Switch_Bat_On()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/switch/battery_dn")
                        
                        if ZIBO_BAT_COVER_POSITION == 1 then
                            command_once("laminar/B738/button_switch_cover02")
                        end
		else
			command_once("laminar/B738/toggle_switch/gpu_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Bat_On", "Switch_Bat_On", "AceXSP_Switch_Bat_On()", "", "")

	function AceXSP_Switch_Bat_Off()
		if XSP_FNBUTTON == 0 then
                        if ZIBO_BAT_COVER_POSITION == 0 then
                            command_once("laminar/B738/button_switch_cover02")
                            sleep(0.1)
                        end
			command_once("laminar/B738/switch/battery_up")
		else
			command_once("laminar/B738/toggle_switch/gpu_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Bat_Off", "Switch_Bat_Off", "AceXSP_Switch_Bat_Off()", "", "")

	function AceXSP_Switch_Alt_On()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/gen1_dn")
			command_once("laminar/B738/toggle_switch/gen2_dn")
		else
			command_once("laminar/B738/toggle_switch/apu_gen1_dn")
			command_once("laminar/B738/toggle_switch/apu_gen2_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Alt_On", "Switch_Alt_On", "AceXSP_Switch_Alt_On()", "", "")

	function AceXSP_Switch_Alt_Off()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/gen1_up")
			command_once("laminar/B738/toggle_switch/gen2_up")
		else
			command_once("laminar/B738/toggle_switch/apu_gen1_up")
			command_once("laminar/B738/toggle_switch/apu_gen2_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Alt_Off", "Switch_Alt_Off", "AceXSP_Switch_Alt_Off()", "", "")

	function AceXSP_Switch_Avionics_On()
		if (ZIBO_IRS_LEFT ~= 2) or (ZIBO_IRS_RIGHT ~= 2) then
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_L_right")
			command_once("laminar/B738/toggle_switch/irs_L_right")
			command_once("laminar/B738/toggle_switch/irs_R_right")
			command_once("laminar/B738/toggle_switch/irs_R_right")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Avionics_On", "Switch_Avionics_On", "AceXSP_Switch_Avionics_On()", "", "")
	function AceXSP_Switch_Avionics_Off()
		if (ZIBO_IRS_LEFT ~= 0) or (ZIBO_IRS_RIGHT ~= 0) then
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Avionics_Off", "Switch_Avionics_Off", "AceXSP_Switch_Avionics_Off()", "", "")

	function AceXSP_Switch_Fuel_On()
		if XSP_FNBUTTON == 0 then
			if ZIBO_FUEL_LEFT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
			if ZIBO_FUEL_LEFT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
			if ZIBO_FUEL_RIGHT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
			if ZIBO_FUEL_RIGHT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
		else
			if ZIBO_FUEL_LEFT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
			if ZIBO_FUEL_LEFT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
			if ZIBO_FUEL_RIGHT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
			if ZIBO_FUEL_RIGHT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
			if ZIBO_FUEL_CENTER1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr1") end
			if ZIBO_FUEL_CENTER2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr2") end
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Fuel_On", "Switch_Fuel_On", "AceXSP_Switch_Fuel_On()", "", "")

	function AceXSP_Switch_Fuel_Off()
		if XSP_FNBUTTON == 0 then
			if ZIBO_FUEL_LEFT1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
			if ZIBO_FUEL_LEFT2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
			if ZIBO_FUEL_RIGHT1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
			if ZIBO_FUEL_RIGHT2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
		else
			if ZIBO_FUEL_LEFT1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
			if ZIBO_FUEL_LEFT2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
			if ZIBO_FUEL_RIGHT1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
			if ZIBO_FUEL_RIGHT2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
			if ZIBO_FUEL_CENTER1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr1") end
			if ZIBO_FUEL_CENTER2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr2") end
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Fuel_Off", "Switch_Fuel_Off", "AceXSP_Switch_Fuel_Off()", "", "")

	function AceXSP_Switch_Panel_On()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		else
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Panel_On", "Switch_Panel_On", "AceXSP_Switch_Panel_On()", "", "")

	function AceXSP_Switch_Panel_Off()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		else
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Panel_Off", "Switch_Panel_Off", "AceXSP_Switch_Panel_Off()", "", "")

	
	-- LAND LIGHTS
	function AceXSP_Switch_Land_On()
		command_once("laminar/B738/switch/land_lights_ret_left_dn")
		command_once("laminar/B738/switch/land_lights_ret_left_dn")
		command_once("laminar/B738/switch/land_lights_ret_right_dn")
		command_once("laminar/B738/switch/land_lights_ret_right_dn")
		command_once("laminar/B738/switch/rwy_light_left_on")
		command_once("laminar/B738/switch/rwy_light_right_on")
		set("laminar/B738/switch/land_lights_left_pos", 1)
		set("laminar/B738/switch/land_lights_right_pos", 1)
		set("laminar/B738/switch/land_lights_ret_left_pos", 2)
		set("laminar/B738/switch/land_lights_ret_right_pos", 2)
		set_array("sim/cockpit2/switches/landing_lights_switch", 0, 1)
		set_array("sim/cockpit2/switches/landing_lights_switch", 3, 1)
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Land_On", "Switch_Land_On", "AceXSP_Switch_Land_On()", "", "")
	
	function AceXSP_Switch_Land_Off()
		command_once("laminar/B738/switch/land_lights_ret_left_up")
		command_once("laminar/B738/switch/land_lights_ret_left_up")
		command_once("laminar/B738/switch/land_lights_ret_right_up")
		command_once("laminar/B738/switch/land_lights_ret_right_up")	
		command_once("laminar/B738/switch/rwy_light_left_off")
		command_once("laminar/B738/switch/rwy_light_right_off")
		set("laminar/B738/switch/land_lights_left_pos", 0) 
		set("laminar/B738/switch/land_lights_right_pos", 0)
		set("laminar/B738/switch/land_lights_ret_left_pos", 0)
		set("laminar/B738/switch/land_lights_ret_right_pos", 0)
		set_array("sim/cockpit2/switches/landing_lights_switch", 0, 0)
		set_array("sim/cockpit2/switches/landing_lights_switch", 3, 0)
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Land_Off", "Switch_Land_Off", "AceXSP_Switch_Land_Off()", "", "")
		
end
