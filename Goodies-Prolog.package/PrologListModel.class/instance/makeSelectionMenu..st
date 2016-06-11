private
makeSelectionMenu: aCollection
	| labels lines selectors |
	aCollection isEmpty
		ifTrue: [ ^ nil ].
	labels := OrderedCollection new.
	lines := OrderedCollection new.
	selectors := OrderedCollection new.
	aCollection
		do: [ :association | 
			association isNil
				ifTrue: [ lines add: labels size ]
				ifFalse: [ 
					labels add: association key.
					selectors add: association value ] ].
	^ UIManager default chooseFrom: labels asArray values: selectors asArray lines: lines asArray