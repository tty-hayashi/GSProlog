scanning
xSign
	| char sign |
	sign := self nextChar.
	char := self peekChar.
	char isDigit
		ifTrue: 
			[tokenType := #number.
			token := Number readFrom: source.
			sign == $- ifTrue: [token := token negated]]
		ifFalse: 
			[self unNextChar.
			tokenType := #symbol.
			token := PrologSymbol readFrom: source]