binding and unbinding
noValue: x env: xEnv 
	| assoc |
	x isPrologVariable
		ifTrue: 
			[assoc := self binding: x env: xEnv.
			assoc == nil ifTrue: [^true].
			assoc := assoc cdr.
			^self noValue: assoc car env: assoc cdr].
	^false