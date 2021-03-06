/obj/effect/overmap/sector/exoplanet/snow
	name = "snow exoplanet"
	desc = "Cold planet with limited plant life."
	color = "#e8faff"
	planetary_area = /area/exoplanet/snow
	rock_colors = list(COLOR_DARK_BLUE_GRAY, COLOR_GUNMETAL, COLOR_GRAY80, COLOR_DARK_GRAY)
	possible_features = list(/datum/map_template/ruin/exoplanet/monolith,
							 /datum/map_template/ruin/exoplanet/oasis,
							 /datum/map_template/ruin/exoplanet/oasis/oasis2,
							 /datum/map_template/ruin/exoplanet/oasis/oasis3,
							 /datum/map_template/ruin/exoplanet/fountain,
							 /datum/map_template/ruin/exoplanet/hydrobase,
							 /datum/map_template/ruin/exoplanet/lodge,
							 /datum/map_template/ruin/exoplanet/crashed_pod,
							 /datum/map_template/ruin/exoplanet/drill_site,
							 /datum/map_template/ruin/exoplanet/hut,
							 /datum/map_template/ruin/exoplanet/playablecolony,
							 /datum/map_template/ruin/exoplanet/datacapsule)

/obj/effect/overmap/sector/exoplanet/snow/generate_map()
	..()
	for(var/zlevel in map_z)
		var/datum/random_map/noise/exoplanet/M = new /datum/random_map/noise/exoplanet/snow(null,1,1,zlevel,maxx,maxy,0,1,1,planetary_area)
		get_biostuff(M)
		new /datum/random_map/noise/ore/poor(null,1,1,zlevel,maxx,maxy,0,1,1)

/obj/effect/overmap/sector/exoplanet/snow/generate_atmosphere()
	..()
	if(atmosphere)
		atmosphere.temperature = T0C - rand(10, 100)
		atmosphere.update_values()

/datum/random_map/noise/exoplanet/snow
	descriptor = "snow exoplanet"
	smoothing_iterations = 1
	flora_prob = 10
	large_flora_prob = 20
	water_level_max = 3
	land_type = /turf/simulated/floor/exoplanet/snow
	water_type = /turf/simulated/floor/exoplanet/ice
	fauna_types = list(/mob/living/simple_animal/hostile/retaliate/beast/samak, /mob/living/simple_animal/hostile/retaliate/beast/diyaab, /mob/living/simple_animal/hostile/retaliate/beast/shantak)
	plantcolors = list("#d0fef5","#93e1d8","#93e1d8", "#b2abbf", "#3590f3", "#4b4e6d")

/area/exoplanet/snow
	ambience = list('sound/effects/wind/tundra0.ogg','sound/effects/wind/tundra1.ogg','sound/effects/wind/tundra2.ogg','sound/effects/wind/spooky0.ogg','sound/effects/wind/spooky1.ogg')
	base_turf = /turf/simulated/floor/exoplanet/snow/

/datum/random_map/noise/ore/poor
	deep_val = 0.8
	rare_val = 0.7
	min_rare_ratio = 0.02
	min_rare_ratio = 0.01

/turf/simulated/floor/exoplanet/ice
	name = "ice"
	icon = 'icons/turf/snow.dmi'
	icon_state = "ice"

/turf/simulated/floor/exoplanet/ice/on_update_icon()
	return

/turf/simulated/floor/exoplanet/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/simulated/floor/exoplanet/snow/New()
	icon_state = pick("snow[rand(1,12)]","snow0")
	..()

/turf/simulated/floor/exoplanet/snow/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	name = "permafrost"
	icon_state = "permafrost"