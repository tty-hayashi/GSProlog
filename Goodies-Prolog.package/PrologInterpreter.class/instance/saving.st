system predicates
saving
	(self containingWindow fileSave: 'Please input a filename for saving.' translated)
		ifNotNil: [ :aFileReference | 
			self saveOn: aFileReference writeStream.
			^ true ].
	^ false