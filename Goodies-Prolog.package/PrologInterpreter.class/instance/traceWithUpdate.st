menu messages
traceWithUpdate
	self trace.
	self textCollector cr; nextPutAll: self listingText; flush.
	self updatePredList