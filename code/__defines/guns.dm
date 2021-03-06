#define CALIBER_PISTOL_TINY     	"5.6mmP"
#define CALIBER_PISTOL 				"10mmP"
#define CALIBER_PISTOL_FAST     	"5.7mmP"
#define CALIBER_PISTOL_SMALL 	    "9mmP"
#define CALIBER_PISTOL_SMALL_MAGNUM "9mmR"
#define CALIBER_PISTOL_MAGNUM 		"12.7mmP"
#define CALIBER_PISTOL_FLECHETTE 	"4mmP"
#define CALIBER_PISTOL_BIG		    "11.4mmP"
#define CALIBER_PISTOL_BIG_MAGNUM   "11.1mmR"

#define CALIBER_RIFLE				"7.62mm"
#define CALIBER_RIFLE_MILITARY  	"5.56mm"
#define CALIBER_RIFLE_SNIPER    	"7.62mmR"
#define CALIBER_ANTIMATERIAL_SMALL  "12.7mmR"
#define CALIBER_ANTIMATERIAL    	"15mmR"

#define CALIBER_SHOTGUN				"12g"
#define CALIBER_GYROJET				"20mmG"
#define CALIBER_CAPS				"caps"
#define CALIBER_DART				"darts"

#define HOLD_CASINGS	0 //do not do anything after firing. Manual action, like pump shotguns, or guns that want to define custom behaviour
#define CLEAR_CASINGS	1 //clear chambered so that the next round will be automatically loaded and fired, but don't drop anything on the floor
#define EJECT_CASINGS	2 //drop spent casings on the ground after firing
#define CYCLE_CASINGS	3 //cycle casings, like a revolver. Also works for multibarrelled guns

//Gun loading types
#define SINGLE_CASING 	1	//The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2	//Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4	//The magazine item itself goes inside the gun


#define GUN_BULK_RIFLE  5