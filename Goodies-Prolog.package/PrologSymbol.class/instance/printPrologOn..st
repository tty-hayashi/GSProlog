printing
printPrologOn: aStream 
	| map flag firstChar i length x |
	map := PrologCharMap symbolMap.
	flag := false.
	self do: [:each | (map at: each asInteger)
			ifFalse: [flag := true]].
	string isEmpty
		ifTrue: 
			[aStream nextPutAll: ''''.
			aStream nextPutAll: '''']
		ifFalse: 
			[firstChar := string at: 1.
			((firstChar >= $A and: [firstChar <= $Z])
				or: [flag])
				ifTrue: 
					[aStream nextPutAll: ''''.
					i := 0.
					length := string size.
					[(i := i + 1) <= length]
						whileTrue: 
							[aStream nextPut: (x := string at: i).
							x == $' ifTrue: [aStream nextPut: x]].
					aStream nextPutAll: '''']
				ifFalse: 
					[i := 0.
					length := string size.
					[(i := i + 1) <= length]
						whileTrue: 
							[aStream nextPut: (x := string at: i).
							x == $' ifTrue: [aStream nextPut: x]]]]