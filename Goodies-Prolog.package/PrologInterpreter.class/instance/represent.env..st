representation
represent: x env: xEnv 
	| assoc a d |
	x isPrologVariable
		ifTrue: 
			[assoc := self binding: x env: xEnv.
			assoc == nil ifTrue: [^self variableRepresent: x env: xEnv].
			assoc := assoc cdr.
			^self represent: assoc car env: assoc cdr].
	(x consp) ifFalse: [^x].
	a := self represent: x car env: xEnv.
	d := self represent: x cdr env: xEnv.
	^x class car: a cdr: d