Class {
	#name : #VSBoxLayoutComposition,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSBoxLayoutComposition >> compare: aUnit with: otherUnit [
	^ 1 - ((aUnit boxLayout difference: otherUnit boxLayout) size / aUnit tree size) 
]

{ #category : #testing }
VSBoxLayoutComposition >> name [
	^ 'Box layout composition'
]
