functions
structureList
	"disassemble prolog structure of myself into a list."
	^self functor cons: ((self car) cons: ((self cdr) cons: nil))