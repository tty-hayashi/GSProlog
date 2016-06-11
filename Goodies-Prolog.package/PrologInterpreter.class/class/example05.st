examples
example05
	"PrologInterpreter example05."

	| string prolog result |
	string := '

	image({Form fromUser}).
	graphicsContext({Display}).
	point({100@100}).
	?- image(X), graphicsContext(Y), point(Z), send(X,displayOn:at:,[Y,Z]).

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