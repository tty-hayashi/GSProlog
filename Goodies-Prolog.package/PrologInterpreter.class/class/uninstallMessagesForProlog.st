class initialization
uninstallMessagesForProlog
	"PrologInterpreter uninstallMessagesForProlog."

	| target protocol organizer selectors |
	target := Object.
	protocol := self protocol.
	organizer := target organization.
	selectors := organizer listAtCategoryNamed: protocol.
	selectors do: [:selector | target removeSelector: selector].
	organizer removeCategory: protocol