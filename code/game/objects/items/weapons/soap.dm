/obj/item/weapon/soap
	name = "soap"
	desc = "A cheap bar of soap. Doesn't smell."
	gender = PLURAL
	icon = 'icons/obj/lavatory.dmi'
	icon_state = "soap"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	w_class = ITEM_SIZE_SMALL
	throwforce = 0
	throw_speed = 4
	throw_range = 20
	var/key_data

/obj/item/weapon/soap/New()
	..()
	create_reagents(30)
	wet()

/obj/item/weapon/soap/proc/wet()
	reagents.add_reagent(/datum/reagent/space_cleaner, 15)

/obj/item/weapon/soap/Crossed(var/mob/living/AM)
	if (istype(AM))
		if(AM.pulledby)
			return
		if(!AM.weakened || !AM.resting)
			AM.slip("the [src.name]",3)

/obj/item/weapon/soap/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity) return
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	var/cleaned = FALSE
	if(user.client && (target in user.client.screen))
		to_chat(user, "<span class='notice'>You need to take that [target.name] off before cleaning it.</span>")
	else if(istype(target,/turf) || istype(target, /obj/structure/catwalk) || istype(target,/obj/effect/decal/cleanable))
		var/turf/T = get_turf(target)
		if(!T)
			return
		var/list/cleanable = list()
		for(var/obj/effect/C in T)
			if(istype(C, /obj/effect/rune) || istype(C, /obj/effect/decal/cleanable) || istype(C, /obj/effect/overlay))
				cleanable += C
		if(!cleanable.len)
			to_chat(usr, "<span class='notice'>\The [T] is already clean.</span>")
			return
		user.visible_message("<span class='notice'>[user] starts scrubbing \the [T].</span>")
		for(var/obj/effect/E in cleanable)
			var/CD = rand(15,25)
			user.setClickCooldown(CD)
			if(do_after(user, CD, E))
				if(istype(E, /obj/effect/decal/cleanable/blood))
					to_chat(user, "<span class='notice'>You scrub \the [E] out.</span>")
					E.clean_blood()
					cleaned = TRUE
				else
					to_chat(user, "<span class='notice'>You scrub \the [E] out.</span>")
					qdel(E)
					cleaned = TRUE
			else
				user.setClickCooldown(0)
				break
	else if(istype(target,/obj/structure/hygiene/sink))
		to_chat(user, "<span class='notice'>You wet \the [src] in the sink.</span>")
		wet()
	else
		to_chat(user, "<span class='notice'>You start to clean \the [target.name]...</span>")
		if(!do_mob(user, target, 30))
			return
		to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
		target.clean_blood() //Clean bloodied atoms. Blood decals themselves need to be handled above.
		cleaned++

	if(cleaned)
		user.update_personal_goal(/datum/goal/clean, TRUE)

//attack_as_weapon
/obj/item/weapon/soap/attack(mob/living/target, mob/living/user, var/target_zone)
	if(target && user && ishuman(target) && ishuman(user) && !target.stat && !user.stat && user.zone_sel &&user.zone_sel.selecting == BP_MOUTH)
		user.visible_message("<span class='danger'>\The [user] washes \the [target]'s mouth out with soap!</span>")
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //prevent spam
		return
	..()

/obj/item/weapon/soap/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/weapon/key))
		if(!key_data)
			to_chat(user, "<span class='notice'>You imprint \the [I] into \the [src].</span>")
			var/obj/item/weapon/key/K = I
			key_data = K.key_data
			update_icon()
		return
	..()

/obj/item/weapon/soap/on_update_icon()
	overlays.Cut()
	if(key_data)
		overlays += image('icons/obj/items.dmi', icon_state = "soap_key_overlay")

/obj/item/weapon/soap/nanotrasen
	desc = "A NanoTrasen-brand bar of soap. Smells of phoron."
	icon_state = "soapnt"

/obj/item/weapon/soap/deluxe
	icon_state = "soapdeluxe"

/obj/item/weapon/soap/deluxe/New()
	desc = "A deluxe Waffle Co. brand bar of soap. Smells of [pick("lavender", "vanilla", "strawberry", "chocolate" ,"space")]."
	..()

/obj/item/weapon/soap/syndie
	desc = "An untrustworthy bar of soap. Smells of fear."
	icon_state = "soapsyndie"

/obj/item/weapon/soap/gold
	desc = "One true soap to rule them all."
	icon_state = "soapgold"
