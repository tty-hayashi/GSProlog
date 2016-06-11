scanning
xComment
	| char |
	[(char := self nextChar) = Character cr]
		whileFalse: [char == endChar
				ifTrue: 
					[tokenType := #eof.
					^self]].
	self nextToken