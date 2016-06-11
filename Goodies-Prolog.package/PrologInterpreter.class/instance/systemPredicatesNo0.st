private
systemPredicatesNo0
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		! :- builtin.
		true :- builtin.
		fail :- builtin.
		var(X) :- builtin.
		send(X,Y,Z) :- bulitin.
		send(X,Y,Z,A) :- bulitin.
	')