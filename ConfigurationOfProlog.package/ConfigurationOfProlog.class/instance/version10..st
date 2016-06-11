versions
version10: spec
	<version: '1.0' imports: #('1.0-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec description: 'First release'.
			spec author: 'nsh'.
			spec timestamp: '3/23/2015 11:47'.
			spec package: 'Prolog' with: 'Goodies-Prolog-BernardoContreras.15' ]