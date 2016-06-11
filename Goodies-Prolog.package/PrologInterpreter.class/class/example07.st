examples
example07
	"PrologInterpreter example07."

	| string prolog result |
	string := '

	?- is(X,+(3,4)).
	?- is(X,F(3,4)).

	'.
	prolog := PrologInterpreter new.
	prolog textCollector: Transcript.
	result := prolog refute: string
				action: 
					[:answer | 
					answer keys asSortedCollection
						do: 
							[:s | 
							Transcript show: s.
							Transcript show: ' = '.
							Transcript show: (answer at: s) printPrologString.
							Transcript cr].
					prolog confirm: 'All right?'].
	Transcript show: result printString; cr