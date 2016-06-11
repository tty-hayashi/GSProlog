instance creation
readFrom: aStream 
	| buffer char |
	buffer := WriteStream on: (String new: 20).
	
	[char := aStream next.
	char = $}]
		whileFalse: 
			[char == nil ifTrue: [Smalltalk tools debugger
					openContext: thisContext
					label: 'Error'
					contents: 'Syntax error near ${ unmatched $}\-- end of file --' withCRs].
			buffer nextPut: char].
	^buffer contents