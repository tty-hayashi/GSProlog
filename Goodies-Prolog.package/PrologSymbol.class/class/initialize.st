class initialization
initialize
	"PrologSymbol initialize"

	PrologSymbolTable := Dictionary new.
	PrologCut := self install: '!'.
	PrologTrue := self install: 'true'.
	PrologFail := self install: 'fail'.
	PrologSend := self install: 'send'.
	PrologVar := self install: 'var'.
	PrologSelf := self install: 'self'