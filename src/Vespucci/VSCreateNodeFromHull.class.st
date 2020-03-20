"
It create a contention tree by anaylzing the composition of the given hulls
"
Class {
	#name : #VSCreateNodeFromHull,
	#superclass : #VSAlgorithm,
	#category : #'Vespucci-Algorithm'
}

{ #category : #'as yet unclassified' }
VSCreateNodeFromHull >> bestParent: aCollectionOfSinglePanes for: aPane [
	| parents |
	parents := aCollectionOfSinglePanes select: [ :possibleParent | 
		possibleParent ~= aPane and: [ possibleParent contains: aPane 
	] ].
	^ parents ifEmpty: [ 
		nil
		] ifNotEmpty: [ parents min ]
]

{ #category : #'as yet unclassified' }
VSCreateNodeFromHull >> node: nodes for: aHull [
	^ nodes at: aHull ifAbsentPut: [ 
		VSNode new id: aHull id; yourself. 
	]
]

{ #category : #'as yet unclassified' }
VSCreateNodeFromHull >> privateExecute: hulls [
	| nodes roots |
	nodes := Dictionary new.
	hulls
		do: [ :p | 
			| parent node bestHull |
			node := self node: nodes for: p.
			bestHull := self bestParent: hulls for: p.
			bestHull ifNotNil: [ parent := self node: nodes for: bestHull.
					parent addChild: node 
				] 
			].
	roots := nodes values select: [ :n | n isRoot ].
	self assert: roots size = 1.
	^ roots first
]
