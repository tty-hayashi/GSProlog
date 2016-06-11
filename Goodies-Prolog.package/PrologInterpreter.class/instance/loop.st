resolve modules
loop
	| structure functor |
	clause == nil
		ifTrue: 
			[queue == nil
				ifTrue: 
					[status := #succ.
					^self].
			clause := queue car.
			clauseEnv := queueEnv car.
			queue := queue cdr.
			queueEnv := queueEnv cdr.
			cutBack := cutBack cdr.
			status := #loop.
			^self].
	structure := clause car.
	structure consp
		ifFalse: 
			[structure := PrologStructure functor: structure terms: nil.
			clause car: structure].
	functor := structure car.
	functor isPrologVariable
		ifTrue: 
			[self call: clause car.
			^self].
	functor isBuiltInPredicate
		ifTrue: 
			[self builtInPredicate: functor.
			^self].
	definition := userPredicates at: functor ifAbsent: [systemPredicates at: functor
					ifAbsent: 
						[status := #back.
						^self]].
	status := #next