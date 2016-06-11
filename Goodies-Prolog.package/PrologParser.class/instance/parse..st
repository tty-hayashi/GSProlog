parsing
parse: sourceStream 
	| label string |
	^self parse: sourceStream
		ifFail: 
			[:errorMessage | 
			label := errorMessage , ' near ' , token printString.
			string := source upToEnd.
			string size > 100 ifTrue: [string := string copyFrom: 1 to: 100].
			self error: label , '\' withCRs , (string = ''
						ifTrue: ['-- end of file --']
						ifFalse: ['--> ' , string])]