representation
expression: x env: xEnv 
	| assoc a d |
	x isPrologVariable
		ifTrue: 
			[assoc := self binding: x env: xEnv.
			assoc == nil ifTrue: [^x].
			assoc := assoc cdr.
			^self expression: assoc car env: assoc cdr].
	(x consp) ifFalse: [^x].
	a := self expression: x car env: xEnv.
	d := self expression: x cdr env: xEnv.
	^x class car: a cdr: d