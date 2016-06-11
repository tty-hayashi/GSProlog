testing
= anObject 
	anObject consp ifFalse: [^false].
	self car = anObject car ifTrue: [^self cdr = anObject cdr].
	^false