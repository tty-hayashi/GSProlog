system predicates
strToSym: listOrString 
	| stream string token |
	listOrString consp
		ifTrue: 
			[| s |
			s := WriteStream on: (String new: 16).
			listOrString do: [:char | s nextPut: (Character value: char)].
			string := s contents]
		ifFalse: [string := listOrString string].
	stream := ReadStream on: string.
	token := (PrologScanner new on: stream) nextToken.
	((self number: token)
		and: [stream atEnd])
		ifTrue: [^token]
		ifFalse: [string = '[]'
				ifTrue: [^nil]
				ifFalse: [^PrologSymbol install: string]]