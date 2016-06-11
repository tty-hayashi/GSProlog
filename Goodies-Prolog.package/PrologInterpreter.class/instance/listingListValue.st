adaptor
listingListValue
	listValue isNil ifTrue: [listValue := PrologListModel new list: self predList].
	^listValue