private
nextChar
	| char |
	char := source next.
	char = Character lf ifTrue: [char := Character cr].
	char = Character cr
		ifTrue: 
			[source peek =  Character lf ifTrue: [source next].
			char := Character cr].
	char == nil ifTrue: [char := endChar].
	^char