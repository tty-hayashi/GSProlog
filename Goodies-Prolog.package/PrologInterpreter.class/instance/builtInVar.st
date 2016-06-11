kernel predicates
builtInVar
	| var |
	var := clause car cdr car.
	(self noValue: var env: clauseEnv)
		ifTrue: 
			[clause := clause cdr.
			status := #loop]
		ifFalse: [status := #back]