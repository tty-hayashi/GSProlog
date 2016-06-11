*Goodies-Prolog-*prolog
cdr
	self == nil ifTrue: [^nil].
	self error: 'send message cdr to atom'