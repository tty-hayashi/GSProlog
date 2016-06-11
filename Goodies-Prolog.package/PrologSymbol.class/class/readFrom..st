instance creation
readFrom: aStream 
	| map buffer char |
	map := PrologCharMap symbolMap.
	buffer := WriteStream on: (String new: 20).
	char := aStream peek.
	char == $'
		ifTrue: 
			[aStream next.
			
			[char := aStream peek.
			char ~~ nil]
				whileTrue: 
					[char = $'
						ifTrue: 
							[aStream next.
							char := aStream peek.
							char = $' ifFalse: [^self install: buffer contents]].
					buffer nextPut: aStream next].
		Smalltalk tools debugger
				openContext: thisContext
				label: 'Error'
				contents: 'Syntax error near $'' unmatched $''\-- end of file --' withCRs].
	(self expect: '=..' on: aStream)
		ifTrue: ["Non standard (or ad hoc) parsing patterns."
			^self install: '=..'].
	[char ~~ nil and: [map at: char asInteger]]
		whileTrue: 
			[buffer nextPut: aStream next.
			char := aStream peek].
	^self install: buffer contents