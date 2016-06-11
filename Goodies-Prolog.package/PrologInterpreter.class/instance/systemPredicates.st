system predicates
systemPredicates
	| collection list |
	collection := systemPredicates associations asSortedCollection.
	list := nil.
	collection reverseDo: [:each | ((each key respondsTo: #asString)
			and: [each key string isEmpty not and: [each key string first = $~]])
			ifTrue: ['not adding: invisible predicate' yourself]
			ifFalse: [list := each key cons: list]].
	^list