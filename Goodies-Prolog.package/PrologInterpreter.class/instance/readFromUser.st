menu messages
readFromUser
	| result |
	(result := self read) notNil
		ifTrue: [self textCollector cr; nextPutAll: result printPrologString; flush]