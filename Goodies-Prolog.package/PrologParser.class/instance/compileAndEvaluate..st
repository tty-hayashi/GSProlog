private
compileAndEvaluate: aString 
	| string object |
	compiler isNil ifTrue: [ compiler := Compiler new ].
	string := aString copy.
	
	[ object := compiler 
		evaluate: string
		in: nil
		to: nil
		notifying: nil
		ifFail: [  ] ] 
		on: Error
		do: [ :exception | exception pass ].
	^ object