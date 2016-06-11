instance creation
list: anArray
	| size list |
	size := anArray size.
	list := nil.
	size
		to: 1
		by: -1
		do: [:i | list := self car: (anArray at: i) cdr: list].
	^list