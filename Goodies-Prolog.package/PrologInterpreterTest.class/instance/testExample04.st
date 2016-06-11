testing
testExample04
	| string prolog result |
	string := '?- append(X,Y,[a,b,c,d]).'.
	prolog := PrologInterpreter new.
	result := prolog
				refute: string
				action: [:answer | 
					answer keys asSortedCollection
						do: [:s | ].
					true].
	self assert: result = true.
	self assert: prolog userPredicates isNil.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates