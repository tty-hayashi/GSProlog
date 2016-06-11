scanning
nextToken
	| char |
	mark := source position.
	char := self peekChar.
	tokenType := typeTable at: char asInteger.
	[tokenType == #xDelimiter]
		whileTrue: 
			[self nextChar.
			char := self peekChar.
			tokenType := typeTable at: char asInteger].
	(tokenType at: 1) = $x
		ifTrue:[self multiChar: tokenType]
		ifFalse:[self singleChar: tokenType].
	^token