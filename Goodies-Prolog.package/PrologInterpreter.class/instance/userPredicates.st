system predicates
userPredicates
	| collection list |
	collection := userPredicates associations asSortedCollection.
	list := nil.
	collection reverseDo: [:each | ((each key respondsTo: #string)
			and: [each key string isEmpty not and: [each key string first = $~]])
			ifTrue: ['not adding: invisible predicate' yourself]
			ifFalse: [list := each key cons: list]].
	^list