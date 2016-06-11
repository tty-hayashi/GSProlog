outputting
outputAnswer: dict 
	| anArray string assoc |
	anArray := dict associations asSortedCollection.
	1 to: anArray size do: [:i | 
		assoc := anArray at: i.
		i = 1
			ifTrue: [string := '']
			ifFalse: [string := ',\' withCRs].
		string := string , assoc key.
		string := string , ' = '.
		string := string , assoc value printPrologString.
		string := string , ' '.
		textCollector show: string]