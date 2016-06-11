*Goodies-Prolog-*prolog
car
	self == nil ifTrue: [^nil].
	self error: 'send message car to atom'