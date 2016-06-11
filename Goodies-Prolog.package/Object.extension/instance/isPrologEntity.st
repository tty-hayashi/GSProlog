*Goodies-Prolog-*prolog
isPrologEntity
	self == nil ifTrue: [^true].
	(self isKindOf: Number)
		ifTrue: [^true].
	^false