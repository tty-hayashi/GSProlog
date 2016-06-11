system predicates
userListing
	| predicateName |
	(userPredicates associations asSortedCollection)
		do: 
			[:assoc | 
			predicateName := assoc key.
			self userListing: predicateName].
	^true