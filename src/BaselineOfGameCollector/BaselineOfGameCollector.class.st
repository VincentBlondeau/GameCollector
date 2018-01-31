Class {
	#name : #BaselineOfGameCollector,
	#superclass : #BaselineOf,
	#category : #BaselineOfGameCollector
}

{ #category : #baseline }
BaselineOfGameCollector >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'GameCollector'.
			"alien"
			spec group: 'default' with: #('GameCollector') ]
]
