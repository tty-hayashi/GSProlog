binding and unbinding
unbindFrom: start to: end 
	| list env assocList |
	list := start.
	[list ~~ end]
		whileTrue: 
			[env := list car.
			assocList := env cdr.
			assocList car cdr cdr: nil.
			env cdr: assocList cdr.
			list := list cdr]