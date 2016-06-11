system predicates
list: x 
	x == nil ifTrue: [^true].
	^self dotp: x