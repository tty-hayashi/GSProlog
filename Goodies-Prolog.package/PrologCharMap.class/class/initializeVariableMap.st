class initialization
initializeVariableMap
	| newMap |
	newMap := self new: 256 withAll: false.
	newMap atAll: ($0 asInteger to: $9 asInteger)
		put: true.
	newMap atAll: ($A asInteger to: $Z asInteger)
		put: true.
	newMap atAll: ($a asInteger to: $z asInteger)
		put: true.
	newMap at: $~ asInteger put: true.
	VariableMap := newMap