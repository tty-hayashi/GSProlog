system predicates
write: anObject
	(anObject isKindOf: PrologString)
		ifTrue: [textCollector show: anObject asString]
		ifFalse: [textCollector show: anObject printPrologString].
	^true