/************
* NSV sierra *
************/
var/const/access_aquila = 76
/datum/access/aquila
	id = access_aquila
	desc = "Aquila"
	region = ACCESS_REGION_RESEARCH

/var/const/access_expedition_shuttle_helm = 77
/datum/access/exploration_shuttle_helm
	id = access_expedition_shuttle_helm
	desc = "Charon Helm"
	region = ACCESS_REGION_RESEARCH

/var/const/access_iaa = 78
/datum/access/iaa
	id = access_iaa
	desc = "Internal Affairs Agent"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, Captain and RD cannot enter

/var/const/access_gun = 87
/datum/access/gun
	id = access_gun
	desc = "BSA Cannon"
	region = ACCESS_REGION_COMMAND

/var/const/access_expedition_shuttle = 88
/datum/access/exploration_shuttle
	id = access_expedition_shuttle
	desc = "Charon"
	region = ACCESS_REGION_RESEARCH

/var/const/access_guppy = 89
/datum/access/guppy
	id = access_guppy
	desc = "General Utility Pod"
	region = ACCESS_REGION_SUPPLY

/var/const/access_seneng = 90
/datum/access/seneng
	id = access_seneng
	desc = "Senior Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_guard = 92
/datum/access/guard
	id = access_guard
	desc = "Guard Equipment"
	region = ACCESS_REGION_SECURITY

/var/const/access_seceva = 95
/datum/access/seceva
	id = access_seceva
	desc = "Security EVA"
	region = ACCESS_REGION_SECURITY