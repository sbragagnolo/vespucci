"
It create a contention tree by anaylzing the composition of the given hulls
"
Class {
	#name : #VSFromHullToNode,
	#superclass : #VSAlgorithm,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSFromHullToNode >> bestParent: aCollectionOfSinglePanes for: aPane [
	| parents |
	parents := aCollectionOfSinglePanes select: [ :possibleParent | 
		possibleParent ~= aPane and: [ possibleParent contains: aPane 
	] ].
	^ parents ifEmpty: [ nil ] ifNotEmpty: [ parents min ]
]

{ #category : #'as yet unclassified' }
VSFromHullToNode >> node: nodes for: aHull [
	^ nodes at: aHull ifAbsentPut: [ 
		VSNode new id: aHull id; yourself. 
	]
]

{ #category : #'as yet unclassified' }
VSFromHullToNode >> privateExecute: hulls [
	| nodes roots |
	nodes := Dictionary new.
	hulls
		do: [ :p | 
			| parent node bestHull |
			bestHull := self bestParent: hulls for: p.
			bestHull
				ifNotNil: [ parent := self node: nodes for: bestHull.
					node := self node: nodes for: p.
					parent addChild: node ] ].
	roots := nodes values select: [ :n | n isRoot ].
	self assert: roots size = 1.
	^ roots first
]
