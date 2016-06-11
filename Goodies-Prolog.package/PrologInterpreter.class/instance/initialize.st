initialize-release
initialize
	super initialize.
	systemPredicates := Dictionary new.
	userPredicates := Dictionary new.
	tracePredicates := Dictionary new.
	textCollector := Transcript new.
	verbose := false.
	self makeSystemPredicates