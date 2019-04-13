/datum/job/captain
	title = "Captain"
	department = "Command"
	supervisors = "the NanoTrasen"
	department_flag = COM
	head_position = 1
	minimal_player_age = 21
	economic_power = 20
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/captain
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)


	skill_points = 25

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/first_mate
	title = "First Mate"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain"
	selection_color = "#2f2f7f"
	minimal_player_age = 18
	economic_power = 7
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/adjutant
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	skill_points = 20


	access = list(	access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
					access_heads, access_bridge, access_janitor, access_kitchen, access_cargo, access_RC_announce, access_keycard_auth,
					access_guppy, access_guppy_helm, access_external_airlocks, access_expedition_shuttle,
					access_eva, access_hangar, access_explorer, access_expedition_shuttle_helm, access_gun)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/adjutant/get_description_blurb()
	return "You are an Adjutant. You do not give orders of your own. You are subordinate to all of command. You handle matters on the bridge and report directly to the Captain and Head of Personnel. You take the sierra's helm. You monitor bridge computer programs and communications and report relevant information to command. Sometimes you can also give support for vessel's departments - you have radio keys in bridge's storage for that purpose."
