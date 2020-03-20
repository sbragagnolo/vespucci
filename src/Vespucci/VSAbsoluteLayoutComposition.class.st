Class {
	#name : #VSAbsoluteLayoutComposition,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSAbsoluteLayoutComposition >> compare: aUnit with: otherUnit [
	^ 1 - ((aUnit absoluteLayout difference: otherUnit absoluteLayout) size / aUnit tree size) 
]

{ #category : #testing }
VSAbsoluteLayoutComposition >> name [
	^ 'Absolute layout composition'
]
