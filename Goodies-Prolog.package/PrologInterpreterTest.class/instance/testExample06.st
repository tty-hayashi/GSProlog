testing
testExample06
	| string prolog result |
	string := '

	?- send(123,+,[456],X).   % X := 123 + 456.

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