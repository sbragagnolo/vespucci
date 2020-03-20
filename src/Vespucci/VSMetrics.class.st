Class {
	#name : #VSMetrics,
	#superclass : #Object,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSMetrics >> compare: aUnit with: otherUnit [
	self subclassResponsibility 
]

{ #category : #testing }
VSMetrics >> name [
	^ self subclassResponsibility
]
