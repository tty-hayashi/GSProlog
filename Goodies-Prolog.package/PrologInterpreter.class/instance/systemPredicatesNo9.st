private
systemPredicatesNo9
	"PrologInterpreter flushSystemPredicates."

	self systemReconsult: (ReadStream on: '
		%
		%	User System Predicates
		%
	')