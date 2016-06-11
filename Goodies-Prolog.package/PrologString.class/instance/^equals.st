testing
= anObject 
	anObject class = self class ifFalse: [^false].
	^self string = anObject string