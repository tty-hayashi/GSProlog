system predicates
systemListing
	| predicateName |
	systemPredicates associations asSortedCollection
		do: 
			[:assoc | 
			predicateName := assoc key.
			((predicateName respondsTo: #asString)
				and: [predicateName string isEmpty not and: [predicateName string first = $~]])
				ifFalse: [self systemListing: predicateName]].
	^true