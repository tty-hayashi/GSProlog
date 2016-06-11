system predicates
notrace
	userPredicates associationsDo: [:assoc | self nospy: assoc key].
	^true