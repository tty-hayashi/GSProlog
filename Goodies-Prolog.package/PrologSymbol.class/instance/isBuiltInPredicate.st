testing
isBuiltInPredicate
	self isPrologCut ifTrue: [^true].
	self isPrologTrue ifTrue: [^true].
	self isPrologFail ifTrue: [^true].
	self isPrologSend ifTrue: [^true].
	self isPrologVar ifTrue: [^true].
	^false