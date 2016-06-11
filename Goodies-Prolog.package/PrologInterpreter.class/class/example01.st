examples
example01
	"PrologInterpreter example01."

	| string prolog result |
	string := '

	?- remove.	   % remove all predicates in PrologDataBase.
	likes(john,mary).    % assert fact.
	likes(john,wine).    % assert fact.
	likes(mary,wine).    % assert fact.
	likes(mary,john).    % assert fact.
	?- likes(X,Y).		   % question goal.
	?- likes(john,X), likes(mary,X). % question goal.

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