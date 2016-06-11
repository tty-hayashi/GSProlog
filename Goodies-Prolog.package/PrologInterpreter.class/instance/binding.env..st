binding and unbinding
binding: x env: xEnv 
	| assocList |
	assocList := xEnv cdr.
	assocList == nil ifTrue: [^nil].
	^assocList assoc: x