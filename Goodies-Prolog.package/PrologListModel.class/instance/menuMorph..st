pluggable messages
menuMorph: aMenu 
	self menuItems
		do: [:each | | selector | aMenu
				add: each key
				target: self
				selector: (selector := each value)
				argumentList: (selector numArgs < 2
						ifTrue: [Array with: self]
						ifFalse: [selector numArgs == 2
								ifTrue: [Array with: self with: #secondParameter]
								ifFalse: [Array
										with: self
										with: #secondParameter
										with: #thirdParameter]])].
	aMenu addLine.
	^ aMenu