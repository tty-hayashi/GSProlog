testing
testExample08
	| string prolog result |
	string := '

	?- append(X,Y,[1,2,3,4]).	

	'.
	prolog := PrologInterpreter new.
	result := prolog
				refute: string
				action: [:answer | 
					answer keys asSortedCollection
						do: [:s | s].
					true].
	prolog acceptWith: string.
	self assert: result = true.
	self assert: prolog userPredicates isNil.
	self assert: prolog contents = string.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates