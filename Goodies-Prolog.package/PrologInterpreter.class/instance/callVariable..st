kernel predicates
callVariable: aPrologVariable 
	| horn functor |
	horn := self expression: aPrologVariable env: clauseEnv.
	(self
		unify: aPrologVariable
		env: clauseEnv
		and: horn
		env: clauseEnv)
		ifFalse: [self error: 'Unexpected unify horn clause'].
	horn consp ifFalse: [horn := PrologStructure functor: horn terms: nil].
	horn car consp ifFalse: [horn := PrologClause head: horn body: nil].
	horn := PrologClause head: horn car body: (PrologBody fromList: horn cdr).
	functor := horn car car.
	functor isPrologVariable
		ifTrue: 
			[status := #back.
			^self].
	clause := clause cdr.
	horn := horn reverse.
	[horn consp]
		whileTrue: 
			[clause := horn car cons: clause.
			horn := horn cdr].
	status := #loop