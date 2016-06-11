enumerating
do: aBlock
	| list |
	list := self.
	[list consp] whileTrue: [
		aBlock value: list car.
		list := list cdr]