Class {
	#name : #VSRelativeLayoutComposition,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSRelativeLayoutComposition >> compare: aUnit with: otherUnit [
	^ 1 - ((aUnit relativeLayout difference: otherUnit relativeLayout) size / aUnit tree size) 
]

{ #category : #testing }
VSRelativeLayoutComposition >> name [
	^ 'Relative layout composition'
]
