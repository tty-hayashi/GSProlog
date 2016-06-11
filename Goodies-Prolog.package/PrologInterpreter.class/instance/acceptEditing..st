adaptor
acceptEditing: aText 
	| readStream |
	textCollector show: '<reconsult from editor>\' withCRs.
	readStream := ReadStream on: aText asString.
	Cursor read showWhile: [self reconsult: readStream action: nil].
	self updatePredList.
	^true