kernel predicates
call: aPrologStructure 
	| structure functor |
	aPrologStructure cdr == nil
		ifTrue: 
			[self callVariable: aPrologStructure car.
			^self].
	structure := self expression: aPrologStructure env: clauseEnv.
	(self
		unify: aPrologStructure
		env: clauseEnv
		and: structure
		env: clauseEnv)
		ifFalse: [self error: 'Unexpected unify structure'].
	functor := structure car.
	functor isPrologVariable
		ifTrue: 
			[status := #back.
			^self].
	clause := clause cdr.
	clause := structure cons: clause.
	status := #loop