examples
example02
	"PrologInterpreter example02."

	| string prolog result |
	string := '

	?- remove.	   % remove all predicates in PrologDataBase.
	on(hen,cat).
	on(cat,dog).
	on(dog,donkey).
	above(X,Y) :-
	    on(X,Y).
	above(X,Y) :-
	    on(X,Z), above(Z,Y).
	?- on(X,dog).
	?- above(X,dog).

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