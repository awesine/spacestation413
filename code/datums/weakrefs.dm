/proc/WEAKREF(datum/input)
	if(istype(input) && !QDELETED(input))
		if(!input.weak_reference)
			input.weak_reference = new /datum/weakref(input)
		return input.weak_reference

/datum/weakref
	var/reference

/datum/weakref/New(datum/thing)
	reference = REF(thing)

/datum/weakref/Destroy()
	return QDEL_HINT_LETMELIVE	//Let BYOND autoGC thiswhen nothing is using it anymore.

/datum/weakref/proc/resolve()
	var/datum/D = locate(reference)
	return (!QDELETED(D) && D.weak_reference == src) ? D : null
