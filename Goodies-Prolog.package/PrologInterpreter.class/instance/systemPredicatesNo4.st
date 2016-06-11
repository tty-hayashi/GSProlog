private
systemPredicatesNo4
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		listing :- send(self,userListing,[]).
		listing(X) :- send(self,userListing:,[X]).
		systemListing :- send(self,systemListing,[]).
		systemListing(X) :- send(self,systemListing:,[X]).
		editing :- send(self,editting,[]).
		consult :- send(self,consult,[]).
		consult(X) :- nonvar(X), send(self,consultFile:,[X]).
		reconsult :- send(self,reconsult,[]).
		reconsult(X) :- nonvar(X), send(self,reconsultFile:,[X]).
		saving :- send(self,saving,[]).
		saving(X) :- send(self,saving:,[X]).
		userPredicates(X) :- send(self,userPredicates,[],X).
		systemPredicates(X) :- send(self,systemPredicates,[],X).
		predicates([X|Y]) :- userPredicates(X), systemPredicates(Y).
		functor(T,F,A) :- nonvar(T), !, send(self,functorArityOf:,[T],[F|A]).
		functor(T,F,A) :- number(F), !, =(0,A),=(T,F).
		functor(T,F,A) :- atom(F), =<(0,A), ''~addvar''([F],A,L), =..(T,L).
		''~addvar''(L,0,M) :- !, =(L,M).
		''~addvar''(L,NVars,M) :- -(NVars, 1, N), append(L,[FreeV],LV), ''~addvar''(LV,N,M).
		arg(Nth,S,T) :- integer(Nth), <(0,Nth), structure(S), =..(S,[F|L]), nth(L,Nth,T).
		=..(X,Y) :- send(self,univ:,[[''X''|''Y'']]).
		name(X,Y) :- atomic(X), list(Y), !, send(self,symToList:,[X],Y).
		name(X,Y) :- atomic(X), !, send(self,symToStr:,[X],Y).
		name(X,Y) :- var(X), !, nonvar(Y), send(self, strToSym:,[Y],X).
		remove :- send(self,remove,[]).
		remove(X) :- send(self,remove:,[X]).
		clause(X) :- send(self,clauseSet:,[X]), repeat, send(self,clause:,[X],X).
		asserta(X) :- send(self,asserta:,[X]).
		assert(X) :- send(self,assertz:,[X]).
		assertz(X) :- send(self,assertz:,[X]).
		retract(X) :- repeat, send(self,retract:,[X],X).
	')