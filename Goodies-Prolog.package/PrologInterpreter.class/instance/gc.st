system predicates
gc
	Transcript cr; show: 'garbage collecting: ', (Smalltalk garbageCollect) asString, ' bytes are available.'.
	^true