instance creation
readFrom: aStream 
	| buffer char string |
	buffer := WriteStream on: (String new: 20).
	char := aStream next.
	char = $" ifTrue: [
		[char := aStream peek.
		char ~~ nil]
			whileTrue: 
				[char = $"
					ifTrue: 
						[aStream next.
						char := aStream peek.
						char = $" ifFalse: [^self fromString: buffer contents]].
				buffer nextPut: aStream next]].
	string := aStream upToEnd.
	string size > 100 ifTrue: [string := string copyFrom: 1 to: 100].
	Smalltalk tools debugger
		openContext: thisContext
		label: 'Error'
		contents: 'Syntax error near $" unmatched $"\' withCRs , (string = ''
					ifTrue: ['-- end of file --']
					ifFalse: ['--> ' , string])