instance creation
install: aString 
	| variable key |
	variable := PrologVariableTable at: aString ifAbsent: [nil].
	variable == nil
		ifTrue: 
			[key := aString.
			variable := self fromString: aString.
			PrologVariableTable at: key put: variable].
	^variable