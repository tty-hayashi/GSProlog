system predicates
trace
	userPredicates associationsDo: [:assoc | self spy: assoc key].
	^true