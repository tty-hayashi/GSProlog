binding and unbinding
fetchValue: x env: xEnv 
	| xx xxEnv assoc |
	xx := x.
	xxEnv := xEnv.
	[true]
		whileTrue: 
			[valueEnv := xxEnv.
			xx isPrologVariable
				ifTrue: 
					[assoc := self binding: xx env: xxEnv.
					assoc == nil ifTrue: [^xx].
					assoc := assoc cdr.
					xx := assoc car.
					xxEnv := assoc cdr]
				ifFalse: [^xx]]