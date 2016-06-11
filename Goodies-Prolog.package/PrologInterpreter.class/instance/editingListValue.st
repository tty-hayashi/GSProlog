adaptor
editingListValue
	listValue isNil ifTrue: [listValue := PrologListModel new list: self predList; parent: self; controller: self].
	^listValue