private
peekChar
	| char |
	char := source peek.
	char = Character lf ifTrue: [char := Character cr].
	char = Character cr ifTrue: [char := Character cr].
	char == nil ifTrue: [char := endChar].
	^char