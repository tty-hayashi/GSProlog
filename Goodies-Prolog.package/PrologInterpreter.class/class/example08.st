examples
example08
	"PrologInterpreter example08."

	| anInterpreter aBlock aString |
	anInterpreter := PrologInterpreter new.
	anInterpreter contents: '?- append(X,Y,[1,2,3,4]).'.
	aBlock :=
		['?- append(X,Y,[1,2,3,4]).
X = [] ,
Y = [1,2,3,4] ;
X = [1] ,
Y = [2,3,4] ;
X = [1,2] ,
Y = [3,4] ;
X = [1,2,3] ,
Y = [4] ;
X = [1,2,3,4] ,
Y = [] ;
no'
			do:
				[:aCharacter |
				Processor yield.
				aString := String with: aCharacter.
				anInterpreter textCollector show: aString]].
	aBlock fixTemps; fork.
	anInterpreter open