Class {
	#name : #VSAmountOfHulls,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #accessing }
VSAmountOfHulls >> compare: aUnit with: otherUnit [
	aUnit hulls size = otherUnit hulls size
		ifTrue: [ ^ 1 ].
	^ 1 - 	((otherUnit hulls size - aUnit hulls size) absolute / aUnit hulls size)
]

{ #category : #accessing }
VSAmountOfHulls >> name [ 
	^ 'Amount of hulls'
]
