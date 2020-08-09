# Configurations
This document describes which customisations of default configuration has made.

## Switch Panel
Below the table of binded functions:

|     Switch     |             ON (actions)             |             OFF (actions)            |                                                                                  Remarks                                                                                 |
|:--------------:|--------------------------------------|--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| BAT            | Battery ON + Close guard             | Battery OFF + Open guard             |                                                                                                                                                                          |
| ALT            | Gen 1 & 2 DOWN                       | Gen 1 & 2 UP                         | With Function ON, it acts on APU instead of Generators                                                                                                                   |
| Avionic Master | Set IRS (L+R) to NAV                 | Set IRS (L+R) to OFF                 |                                                                                                                                                                          |
| Fuel Pump      | Set Fuel Pumps (all AFT & FWD) to ON | Set Fuel Pumps (all AFT & FWD) to ON | If Fuel in center tank is greater than 543 Kg acts on Center Fuel Pumps. With Function ON it acts ever on Center Fuel Pumps even if center tank contain less than 543 Kg |
| De-Ice         | All Window Heat ON                   | All Window Heat OFF                  |                                                                                                                                                                          |
| Pitot Heat     | Probes (A + B) ON                    | Probes (A + B) ON                    |                                                                                                                                                                          |
| Cool           | PACKS (L + R) set to AUTO            | PACKS (L + R) set to OFF             |                                                                                                                                                                          |
| Panel          | Dome lights BRIGHT                   | Dome lights OFF                      |                                                                                                                                                                          |
| Beacon         | Anti-Collision lights ON             | Anti-Collision lights OFF            |                                                                                                                                                                          |
| Nav            | Wing lights + Logo lights ON         | Wing lights + Logo lights OFF        |                                                                                                                                                                          |
| Strobe         | Position light set to ON             | Position light set to STEADY         |                                                                                                                                                                          |
| Taxi           | Taxi lights ON                       | Taxi lights OFF                      | If aircraft is on the ground and visibility is low or hours of darkness, it acts on Runway Turnoff lights                                                                |
| Landing        | Landing lights ON                    | Landing lights OFF                   | If aircraft is on the air (for descent), to exclude before takeoff, it acts on Runway Turnoff lights                                                                     |
| Starter        |                                      |                                      | It controls auto-brakes (RTO - OFF - 1 - 2 - 3)                                                                                                                          |



## Multi-Panel
Below the table of binded functions for Multipanel:

|Pos. Selector| Rotary function           |
|:-----------:|---------------------------|
|     ALT     | MPC Altitude dial         |
|      VS     | MPC Vertical speed wheel  |
|     IAS     | MPC Speed dial            |
|     HDG     | MPC Heading dial          |
|     CRS     | MPC Captain's course dial |

|Button| Function                  |
|:----:|---------------------------|
|   AT | Autothrottle switch       |
| TRIM | MPC Vertical speed wheel  |
| FLAPS| Flaps                     |


Below the table of binded functions for Autopilot:

|Button| Function                                          |
|:----:|---------------------------------------------------|
|  AP  | CMD B (FN) and CMD A (normal)                     |
| HDG  | Switch(On/Off) HDG SEL                            |
| NAV  | Switch (On/Off) LNAV                              |
| IAS  | Switch (On/Off) N1 (FN) and SPEED (normal)        |
| ALT  | Switch (On/Off) ALT HLD (FN) and LVL CHG (normal) |
|  VS  | Switch (On/Off) V/S                               |
| APR  | VOR LOC (FN) and APP (normal)                     |
| REV  | Switch (On/Off) VNAV                              |



## Radio Panels
Configuration are defaults of XSaitekPanels.