system predicates
reconsultFile: fileName
	| aFileStream |
	(FileSystem workingDirectory / fileName) exists
		ifTrue: [ textCollector show: '<reconsult from ' , fileName asString , '>\' withCRs.
			aFileStream := FileStream oldFileNamed: fileName.
			[ self reconsult: aFileStream action: nil ]
				ensure: [ aFileStream close ].
			^ true ]
		ifFalse: [ ^ false ]