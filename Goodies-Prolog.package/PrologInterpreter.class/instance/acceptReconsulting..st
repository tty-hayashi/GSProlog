adaptor
acceptReconsulting: aText 
	| readStream |
	textCollector show: '<reconsult from user>\' withCRs.
	readStream := ReadStream on: aText asString.
	Cursor read showWhile: [self reconsult: readStream action: nil].
	^true