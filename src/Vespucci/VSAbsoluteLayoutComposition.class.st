Class {
	#name : #VSAbsoluteLayoutComposition,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSAbsoluteLayoutComposition >> compare: aUnit with: otherUnit [
	^ 1 - ((aUnit absoluteLayout difference: otherUnit absoluteLayout) dispositions size / (otherUnit absoluteLayout dispositions size + aUnit absoluteLayout dispositions size)) 
]

{ #category : #testing }
VSAbsoluteLayoutComposition >> name [
	^ 'Absolute layout composition'
]
