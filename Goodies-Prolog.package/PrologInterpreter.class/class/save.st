saving
save
	"PrologInterpreter save."
	| fileName classCollection aStream timeStamp |
	fileName := 'Prolog.st'.
	classCollection := self saveClasses.
	aStream := FileStream newFileNamed: fileName asFileName.
	[aStream reset.
	Cursor write
		showWhile: [timeStamp := Date today mmddyyyy , ' ' , Time now asString.
			aStream cr.
			aStream nextChunkPut: timeStamp printString.
			aStream cr; cr.
			(self comment isNil
					or: [self comment isEmpty])
				ifFalse: [aStream nextChunkPut: self comment asString printString.
					aStream cr; cr].
			classCollection
				do: [:aClass | 
					aStream nextChunkPut: aClass definition.
					aStream cr; cr].
			classCollection
				do: [:aClass | 
					aStream nextPut: Character newPage.
					aStream cr.
					aClass fileOutOn: aStream.
					aStream cr]]]
		ensure: [aStream close].
	^ classCollection