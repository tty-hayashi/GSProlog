system predicates
asserta: aPrologClause 
	| horn def functor |
	horn := aPrologClause.
	horn consp ifFalse: [horn := PrologStructure functor: horn terms: nil].
	horn car consp ifFalse: [horn := PrologClause head: horn body: nil].
	horn := PrologClause head: horn car body: (PrologBody fromList: horn cdr).
	functor := horn car car.
	def := userPredicates at: functor ifAbsent: [nil].
	def == nil
		ifTrue: 
			[def := PrologDefinition fromList: (horn cons: nil).
			userPredicates at: functor put: def]
		ifFalse: 
			[def := PrologDefinition fromList: (horn cons: def).
			userPredicates at: functor put: def].
	^true