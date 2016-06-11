kernel predicates
receiver: receiverSymbol selector: selectorSymbol arguments: argumentList 
	| receiver size selector arguments list result index |
	((receiverSymbol isKindOf: PrologSymbol)
		and: [receiverSymbol isPrologSelf])
		ifTrue: [receiver := self]
		ifFalse: [receiver := receiverSymbol].
	(receiver isKindOf: PrologObject)
		ifTrue: [receiver := receiver object].
	size := selectorSymbol size.
	selector := String new: size.
	1 to: size do: [:i | selector at: i put: (selectorSymbol at: i)].
	selector := selector asSymbol.
	list := argumentList.
	list == nil
		ifTrue: 
			[arguments := Array new.
			result := receiver perform: selector]
		ifFalse: 
			[size := list length.
			arguments := Array new: size.
			1 to: size
				do: 
					[:i | 
					arguments at: i put: ((list car isKindOf: PrologObject)
							ifTrue: [list car object]
							ifFalse: [list car]).
					list := list cdr].
			result := receiver perform: selector withArguments: arguments].
	((result = true or: [result = false])
		or: [result isPrologEntity])
		ifTrue: [result := result yourself]
		ifFalse: 
			[list := PrologList car: receiverSymbol cdr: argumentList.
			index := (Array with: receiver)
						, arguments findFirst: [:each | each = result].
			index = 0
				ifTrue: [result := PrologObject source: result printString object: result]
				ifFalse: [result := list nth: index]].
	^result