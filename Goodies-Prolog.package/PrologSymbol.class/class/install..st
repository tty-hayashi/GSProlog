instance creation
install: aString 
	| key symbol |
	key := aString asString.
	symbol := PrologSymbolTable at: key ifAbsent: [nil].
	symbol == nil 
		ifTrue: 
			[symbol := self fromString: aString.
			PrologSymbolTable at: key put: symbol].
	^symbol