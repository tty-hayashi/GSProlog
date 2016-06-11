class initialization
initializeSymbolMap
	| newMap |
	newMap := self new: 256 withAll: false.
	newMap atAll: ($0 asInteger to: $9 asInteger)
		put: true.
	newMap atAll: ($A asInteger to: $Z asInteger)
		put: true.
	newMap atAll: ($a asInteger to: $z asInteger)
		put: true.
	128 to: 256 do: [:i | newMap at: i put: true].
	#($+ $- $! $: $* $/ $\ $> $< $= $_) do: [:each | newMap at: each asInteger put: true].
	SymbolMap := newMap