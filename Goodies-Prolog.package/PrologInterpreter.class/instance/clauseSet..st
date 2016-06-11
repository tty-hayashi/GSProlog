system support
clauseSet: aPrologClause 
	| horn functor def |
	horn := aPrologClause.
	horn consp ifFalse: [horn := PrologStructure functor: horn terms: nil].
	horn car consp ifFalse: [horn := PrologClause head: horn body: nil].
	horn := PrologClause head: horn car body: (PrologBody fromList: horn cdr).
	functor := horn car car.
	def := userPredicates at: functor ifAbsent: [^false].
	definitionStack := def cons: definitionStack.
	^true