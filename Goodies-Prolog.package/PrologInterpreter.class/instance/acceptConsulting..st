adaptor
acceptConsulting: aText 
	| readStream |
	textCollector show: '<consult from user>\' withCRs.
	readStream := ReadStream on: aText asString.
	self consult: readStream action: nil.
	^true