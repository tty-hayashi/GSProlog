system predicates
consultFile: path
	| aFileStream |
	path asFileReference exists
		ifTrue: [ 
			textCollector show: '<consult from ' , path asString , '>\' withCRs.
			aFileStream := FileStream oldFileNamed: path.
			[ self consult: aFileStream action: nil ]
				ensure: [ aFileStream close ].
			^ true ]
		ifFalse: [ ^ false ]