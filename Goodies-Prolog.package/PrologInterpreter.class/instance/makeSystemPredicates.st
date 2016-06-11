private
makeSystemPredicates
	SystemPredicates isNil
		ifTrue: 
			[self systemPredicatesNo0.
			self systemPredicatesNo1.
			self systemPredicatesNo2.
			self systemPredicatesNo3.
			self systemPredicatesNo4.
			self systemPredicatesNo5.
			self systemPredicatesNo6.
			self systemPredicatesNo7.
			self systemPredicatesNo8.
			self systemPredicatesNo9.
			SystemPredicates := systemPredicates]
		ifFalse: [systemPredicates := SystemPredicates]