instance creation
readFrom: aStream 
	| map buffer char |
	map := PrologCharMap variableMap.
	buffer := WriteStream on: (String new: 20).
	char := aStream peek.
	(char ~~ nil and: [char = $~])
		ifTrue: 
			[aStream next.
			self countUp.
			^self install: '~' , PrologVariableCounter printString].
	[char ~~ nil and: [map at: char asInteger]]
		whileTrue: 
			[buffer nextPut: aStream next.
			char := aStream peek].
	^self install: buffer contents