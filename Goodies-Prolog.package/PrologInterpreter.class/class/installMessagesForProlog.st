class initialization
installMessagesForProlog
	"PrologInterpreter installMessagesForProlog."

	| source stream |
	source := '
!Object methodsFor: ''' , self protocol, '''!

car
	self == nil ifTrue: [^nil].
	self error: ''send message car to atom''!

cdr
	self == nil ifTrue: [^nil].
	self error: ''send message cdr to atom''!

cons: anObject 
	^PrologList car: self cdr: anObject!

consp
	^false!

isPrologEntity
	self == nil ifTrue: [^true].
	(self isKindOf: Number)
		ifTrue: [^true].
	^false!

isPrologVariable
	^false!

printPrologOn: aStream 
	self == nil
		ifTrue: 
			[aStream nextPutAll: ''[]''.
			^self].
	(self isKindOf: Number)
		ifTrue: 
			[self printOn: aStream.
			^self].
	aStream nextPut: ${.
	self printOn: aStream.
	aStream nextPut: $}!

printPrologOn: aStream level: anInteger 
	self printPrologOn: aStream!

printPrologString
	| aStream |
	aStream := WriteStream on: (String new: 20).
	self printPrologOn: aStream.
	^aStream contents! !
'.
	stream := ReadWriteStream
				on: source
				from: 0
				to: source size.
	stream fileIn