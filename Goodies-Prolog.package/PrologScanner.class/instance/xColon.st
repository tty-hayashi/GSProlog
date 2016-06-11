scanning
xColon
	| char |
	source next.
	char := source peek.
	char = $-
		ifTrue: 
			[tokenType := #neck.
			self singleChar: tokenType]
		ifFalse: 
			[self unNextToken.
			tokenType := #symbol.
			token := PrologSymbol readFrom: source]