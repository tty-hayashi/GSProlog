menu messages
updatePredList
	self listingListValue list: self predList.
	(self pred isNil
			or: [self pred == 0])
		ifTrue: [self changed: #predList]
		ifFalse: [| symbol | 
			symbol := self predList at: self pred.
			self listingListValue selection: symbol].
	self pred: self pred