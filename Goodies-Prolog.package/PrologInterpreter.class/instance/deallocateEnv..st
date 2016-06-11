private
deallocateEnv: env
	| assocList assoc nextEnv |  
	assocList := env cdr.
	[assocList consp]
		whileTrue: 
			[assoc := assocList car.
			nextEnv := assoc cdr cdr.
			assoc cdr cdr: nil.
			nextEnv consp ifTrue: [self deallocateEnv: nextEnv].
			assocList := assocList cdr]