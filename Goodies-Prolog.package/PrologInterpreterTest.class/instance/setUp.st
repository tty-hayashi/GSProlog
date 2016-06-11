running
setUp
	| prolog |
	prolog := PrologInterpreter new.
	lengthOfSystemPredicates := prolog systemPredicates length.
	prolog := nil