Class {
	#name : #VSHullsInCommon,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSHullsInCommon >> compare: aUnit with: otherUnit [
	^ (aUnit hulls intersection: otherUnit hulls) size / aUnit hulls size
]

{ #category : #testing }
VSHullsInCommon >> name [ 
	^ 'Hulls in common'
]
