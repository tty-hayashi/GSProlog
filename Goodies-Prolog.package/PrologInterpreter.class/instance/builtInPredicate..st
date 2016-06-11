kernel predicates
builtInPredicate: functor 
	functor isPrologCut ifTrue: [^self builtInCut].
	functor isPrologTrue ifTrue: [^self builtInTrue].
	functor isPrologFail ifTrue: [^self builtInFail].
	functor isPrologSend ifTrue: [^self builtInSend].
	functor isPrologVar ifTrue: [^self builtInVar].
	self error: 'Unexpected built-in predicate'