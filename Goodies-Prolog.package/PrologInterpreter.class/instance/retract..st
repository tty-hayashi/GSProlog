system predicates
retract: aPrologClause 
	| count horn def functor prev result |
	count := 0.
	horn := aPrologClause.
	horn consp
		ifFalse: 
			[horn := PrologStructure functor: horn terms: nil.
			count := count + 1].
	horn car consp
		ifFalse: 
			[horn := PrologClause head: horn body: nil.
			count := count + 1].
	horn := PrologClause head: horn car body: (PrologBody fromList: horn cdr).
	functor := horn car car.
	prev := def := userPredicates at: functor ifAbsent: [^PrologSymbol cut].
	[def consp]
		whileTrue: [(self
				unify: horn
				env: self nullEnv
				and: def car
				env: self nullEnv)
				ifTrue: 
					[result := def car.
					count timesRepeat: [result := result car].
					prev == def
						ifTrue: 
							[def cdr isNil
								ifTrue: [userPredicates removeKey: functor ifAbsent: [nil]]
								ifFalse: [userPredicates at: functor put: def cdr].
							^result]
						ifFalse: 
							[prev cdr: def cdr.
							^result]]
				ifFalse: 
					[prev := def.
					def := def cdr]].
	^PrologSymbol cut