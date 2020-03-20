Class {
	#name : #VSNodeComposition,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSNodeComposition >> compare: aUnit with: otherUnit [
	^ ((aUnit tree difference: otherUnit tree) size / aUnit tree size) 
]

{ #category : #testing }
VSNodeComposition >> name [ 
	^ 'Node composition'
]
