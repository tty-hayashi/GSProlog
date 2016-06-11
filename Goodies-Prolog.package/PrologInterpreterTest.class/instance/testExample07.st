testing
testExample07
	| string prolog result |
	string := '

	?- is(X,+(3,4)).
	?- is(X,F(3,4)).

	'.
	prolog := PrologInterpreter new.
	result := prolog
				refute: string
				action: [:answer | 
					answer keys asSortedCollection
						do: [:s | s].
					true].
	self assert: result = true.
	self assert: prolog userPredicates isNil.
	self assert: prolog systemPredicates length == lengthOfSystemPredicates