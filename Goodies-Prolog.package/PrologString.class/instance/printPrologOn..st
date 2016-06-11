printing
printPrologOn: aStream 
	| i length x |
	aStream nextPut: $".
	i := 0.
	length := string size.
	[(i := i + 1) <= length]
		whileTrue: 
			[aStream nextPut: (x := string at: i).
			x == $" ifTrue: [aStream nextPut: x]].
	aStream nextPut: $"