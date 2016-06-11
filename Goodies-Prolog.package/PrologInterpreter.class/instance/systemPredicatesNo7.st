private
systemPredicatesNo7
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		clock(X) :- send({Time},millisecondClockValue,[],X).
		verbose(X) :- send(self,verbose:,[X]).
		gc :- send(self,gc,[]).
		inspect(X) :- send(X,inspect,[]).
		spy(X) :- send(self,spy:,[X]).
		nospy(X) :- send(self,nospy:,[X]).
		trace :- send(self,trace,[]).
		notrace :- send(self,notrace,[]).
	')