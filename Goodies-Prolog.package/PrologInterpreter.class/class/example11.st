examples
example11
	"PrologInterpreter example11."
	| string anInterpreter result |
	string := '?- remove.
likes(john, apple).
likes(john, wine).
likes(john, mary).
likes(john, susan).
likes(mary, wine).
likes(mary, john).
likes(susan, paul).
likes(paul, mary).
lovers(X, Y) :- likes(X,Y), likes(Y,X).
?- clear.
?- listing.
?- lovers(X, Y).'.
	anInterpreter := PrologInterpreter new.
	anInterpreter contents: string.
	anInterpreter open.
	result := anInterpreter 
		refute: string
		action: 
			[ :answer | 
			answer keys asSortedCollection do: 
				[ :s | 
				anInterpreter textCollector show: s.
				anInterpreter textCollector show: ' = '.
				anInterpreter textCollector show: (answer at: s) printPrologString.
				anInterpreter textCollector cr ].
			false ]