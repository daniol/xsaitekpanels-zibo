--[[
	Zibo Boeing 737-800
	Version: 1.13
	Source: https://github.com/daniol/xsaitekpanels-zibo
--]]
if PLANE_ICAO == "B738" then
	-- ************************************************************************************************************************************************************************************************
	-- GLOBAL VARIABLES
	AceXSP_Version = "1.11"
	
	-- Global datarefs
	dataref("XSP_FNBUTTON", "bgood/xsaitekpanels/fnbutton/status", "readonly")
	
	-- Light status datarefs
	dataref("ZIBO_MCP_CMD_A_STATUS", "laminar/B738/autopilot/cmd_a_status", "readonly")
	dataref("ZIBO_MCP_CMD_B_STATUS", "laminar/B738/autopilot/cmd_b_status", "readonly")
	dataref("ZIBO_MCP_HDG_SEL_STATUS", "laminar/B738/autopilot/hdg_sel_status", "readonly")
	dataref("ZIBO_MCP_LNAV_STATUS", "laminar/B738/autopilot/lnav_status", "readonly")
	dataref("ZIBO_MCP_N1_STATUS", "laminar/B738/autopilot/n1_status", "readonly")
	dataref("ZIBO_MCP_SPEED_STATUS", "laminar/B738/autopilot/speed_status1", "readonly")
	dataref("ZIBO_MCP_LVL_CGH_STATUS", "laminar/B738/autopilot/lvl_chg_status", "readonly")
	dataref("ZIBO_MCP_ALT_HLD_STATUS", "laminar/B738/autopilot/alt_hld_status", "readonly")
	dataref("ZIBO_MCP_VNAV_STATUS", "laminar/B738/autopilot/vnav_status1", "readonly")
	dataref("ZIBO_MCP_VS_STATUS", "laminar/B738/autopilot/vs_status", "readonly")
	dataref("ZIBO_MCP_VORLOC_STATUS", "laminar/B738/autopilot/vorloc_status", "readonly")
	dataref("ZIBO_MCP_APP_STATUS", "laminar/B738/autopilot/app_status", "readonly")
	
	-- Integers used to light up Multipanel buttons
	dataref("XSP_Integer1", "bgood/xsaitekpanels/sharedata/integer1", "writable")	-- AP
	dataref("XSP_Integer2", "bgood/xsaitekpanels/sharedata/integer2", "writable")	-- HDG
	dataref("XSP_Integer3", "bgood/xsaitekpanels/sharedata/integer3", "writable")	-- NAV
	dataref("XSP_Integer4", "bgood/xsaitekpanels/sharedata/integer4", "writable")	-- IAS
	dataref("XSP_Integer5", "bgood/xsaitekpanels/sharedata/integer5", "writable")	-- ALT
	dataref("XSP_Integer6", "bgood/xsaitekpanels/sharedata/integer6", "writable")	-- VS
	dataref("XSP_Integer7", "bgood/xsaitekpanels/sharedata/integer7", "writable")	-- APR
	dataref("XSP_Integer8", "bgood/xsaitekpanels/sharedata/integer8", "writable")	-- REV
	
	-- ************************************************************************************************************************************************************************************************
	-- PROGRAM START

	logMsg ( "AceXSP: ** Starting AceXSP_Zibo738X MULTIPANEL version "..AceXSP_Version.." **" )
		
	-- ************************************************************************************************************************************************************************************************
	-- MULTIPANEL COMMANDS
	
	-- AP
	-- LED: XSP_Integer1
	function AceXSP_Multi_Button_AP()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/autopilot/cmd_a_press")
		else
			command_once("laminar/B738/autopilot/cmd_b_press")			
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Multi_Button_AP", "Multi_Button_AP", "AceXSP_Multi_Button_AP()", "", "")
	
	-- IAS
	-- LED: XSP_Integer4
	function AceXSP_Multi_Button_IAS()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/autopilot/speed_press")
		else
			command_once("laminar/B738/autopilot/n1_press")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Multi_Button_IAS", "Multi_Button_IAS", "AceXSP_Multi_Button_IAS()", "", "")

	-- --------------------------------------------------------------------------------------------
	
	-- ALT
	-- LED: XSP_Integer5
	function AceXSP_Multi_Button_ALT()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/autopilot/lvl_chg_press")
		else
			command_once("laminar/B738/autopilot/alt_hld_press")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Multi_Button_ALT", "Multi_Button_ALT", "AceXSP_Multi_Button_ALT()", "", "")

	-- --------------------------------------------------------------------------------------------
	
	-- APR
	-- LED: XSP_Integer7
	function AceXSP_Multi_Button_APR()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/autopilot/app_press")
		else
			command_once("laminar/B738/autopilot/vorloc_press")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Multi_Button_APR", "Multi_Button_APR", "AceXSP_Multi_Button_APR()", "", "")
	
	-- ************************************************************************************************************************************************************************************************
	-- REFRESH LIGHTS
	
	function AceXSP_RefreshLights()
		-- AP
		if ZIBO_MCP_CMD_A_STATUS == 1 or ZIBO_MCP_CMD_B_STATUS == 1 then
			XSP_Integer1 = 2
		else
			XSP_Integer1 = 0
		end

		-- HDG
		if ZIBO_MCP_HDG_SEL_STATUS == 0 then
			XSP_Integer2 = 0
		else
			XSP_Integer2 = 2
		end
		
		-- NAV
		if ZIBO_MCP_LNAV_STATUS == 1 then
			XSP_Integer3 = 2
		else
			XSP_Integer3 = 0
		end

		-- IAS
		if ZIBO_MCP_N1_STATUS == 1 then
			XSP_Integer4 = 1					-- N1 mode - blink
		elseif ZIBO_MCP_SPEED_STATUS == 1  then
			XSP_Integer4 = 2					-- SPD mode - solid
		else
			XSP_Integer4 = 0
		end
		
		-- ALT
		if ZIBO_MCP_LVL_CGH_STATUS == 1 then
			XSP_Integer5 = 1					-- FLCH mode - blink
		elseif ZIBO_MCP_ALT_HLD_STATUS == 1 then
			XSP_Integer5 = 2					-- ALTHLD mode - solid
		else
			XSP_Integer5 = 0
		end
		
		-- VS
		if ZIBO_MCP_VS_STATUS == 1 then
			XSP_Integer6 = 2
		else
			XSP_Integer6 = 0
		end
		
		-- APP
		if ZIBO_MCP_VORLOC_STATUS == 1 and ZIBO_MCP_APP_STATUS == 0 then
			XSP_Integer7 = 1					-- VORLOC mode - blink
		elseif ZIBO_MCP_VORLOC_STATUS == 0 and ZIBO_MCP_APP_STATUS == 1 then
			XSP_Integer7 = 2					-- APP mode - solid
		else
			XSP_Integer7 = 0
		end
		
		-- REV
		if ZIBO_MCP_VNAV_STATUS == 1 then
			XSP_Integer8 = 2
		else
			XSP_Integer8 = 0
		end
		return
	end

	-- --------------------------------------------------------------------------------------------

	do_every_frame("AceXSP_RefreshLights()")
	
end
