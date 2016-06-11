class initialization
initialize
	"PrologScannerTable initialize."

	| newTable |
	newTable := self new: 256 withAll: #xBinary.
	newTable atAll: #(9 10 12 13 32 ) put: #xDelimiter.
	newTable atAll: ($0 asInteger to: $9 asInteger) put: #xDigit.
	newTable atAll: ($A asInteger to: $Z asInteger) put: #xVariable.
	newTable at: $~ asInteger put: #xVariable.
	newTable atAll: ($a asInteger to: $z asInteger) put: #xSymbol.
	128 to: 256 do: [:i | newTable at: i put: #xSymbol].
	#($! $* $/ $\ $> $< $= $_) do: [:each | newTable at: each asInteger put: #xSymbol].
	newTable at: $^ asInteger put: #eof.
	newTable at: $" asInteger put: #xDoubleQuote.
	newTable at: $$ asInteger put: #xDollar.
	newTable at: $' asInteger put: #xSingleQuote.
	newTable at: $( asInteger put: #leftParenthesis.
	newTable at: $) asInteger put: #rightParenthesis.
	newTable at: $. asInteger put: #period.
	newTable at: $: asInteger put: #xColon.
	newTable at: $? asInteger put: #xColon.
	newTable at: $; asInteger put: #semicolon.
	newTable at: $[ asInteger put: #leftBracket.
	newTable at: $] asInteger put: #rightBracket.
	newTable at: ${ asInteger put: #leftBrace.
	newTable at: $} asInteger put: #rightBrace.
	newTable at: $, asInteger put: #comma.
	newTable at: $| asInteger put: #verticalBar.
	newTable at: $+ asInteger put: #xSign.
	newTable at: $- asInteger put: #xSign.
	newTable at: $% asInteger put: #xComment.
	ScanningTable := newTable