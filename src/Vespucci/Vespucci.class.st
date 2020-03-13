"
Main Facade. It gathers some of the algorithms together 
"
Class {
	#name : #Vespucci,
	#superclass : #Object,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
Vespucci class >> createAbsoluteLayoutRepresentationForJsonStream: aStream [
	^ self new createAbsoluteLayoutRepresentationForJsonStream: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createRelativeLayoutRepresentationForJsonStream: aStream [
	^ self new createRelativeLayoutRepresentationForJsonStream: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> loadContentionTreeFromJsonStream: aStream [
	^ self new loadContentionTreeFromJsonStream: aStream
]

{ #category : #'as yet unclassified' }
Vespucci >> bestParent: aCollectionOfSinglePanes for: aPane [
	| parents |
	parents := aCollectionOfSinglePanes select: [ :possibleParent | 
		possibleParent ~= aPane and: [ possibleParent contains: aPane 
	] ].
	^ parents ifEmpty: [ nil ] ifNotEmpty: [ parents min ]
]

{ #category : #'as yet unclassified' }
Vespucci >> createAbsoluteLayoutRepresentationForJsonStream: aStream [
	| hulls layout |
	hulls := self loadHullsFromJsonStream: aStream.
	layout := VSAbsoluteLayout new.
	layout dispositions: (hulls
		collect: [ :h | 
			VSAbsoluteDisposition new
				origin: h origin;
				corner: h corner;
				id: h id;
				yourself ]).
	^ layout 
]

{ #category : #'as yet unclassified' }
Vespucci >> createBoxLayoutRepresentationForJsonStream: aStream [
	| tree baseLayout |
	tree := self loadHullsFromJsonStream: aStream.
	
	baseLayout := VSBoxComposedLayout new .
	baseLayout extent: tree hull extent.
	
	tree acceptBlock: [  : n | 
		n isRoot ifTrue: [ 
			n layout: baseLayout newHorizontal.  
		] ifFalse:[ 
			n layout:( n parent layout layoutFor: n ).
		]	
	].

	baseLayout initializeWithTree: tree.
	^ baseLayout.
	

]

{ #category : #'as yet unclassified' }
Vespucci >> createRelativeLayoutRepresentationForJsonStream: aStream [
	| tree layout  hulls dispositions |

	hulls := self loadHullsFromJsonStream: aStream.
	layout := VSRelativePositionLayout new.
	tree := self loadContentionTree:  hulls.
	dispositions := OrderedCollection new.
	
	
	tree acceptBlock: [ : n | 
		| dispo thisHull parentHull | 
		dispo := VSAbsoluteDisposition new.
		thisHull := 	hulls detect: [ : h |  h id = n id ].
		parentHull := n isRoot ifTrue: [ nil ] ifFalse: [ hulls detect: [ : h | h id = n parent id  ]	].
		dispo origin: ( thisHull origin -( parentHull ifNil: [0@0 ] ifNotNil: [ parentHull origin]) ).
		dispo corner: ( thisHull corner -( parentHull ifNil: [0@0 ] ifNotNil: [ parentHull corner]) ).
		dispo id: n id.
		dispositions add: dispo 
	].
	
	layout dispositions: dispositions.
	^ layout 
	
		
	
]

{ #category : #'as yet unclassified' }
Vespucci >> loadContentionTree: hulls [
	| nodes roots |
	nodes := Dictionary new.
	hulls do: [ :p | 
			| parent node bestHull |
			bestHull := self bestParent: hulls for: p.
			bestHull 	ifNotNil: [ 
				parent := self node: nodes for: bestHull.
				node := self node: nodes for: p.
				parent addChild: node 
			] 
	].
	roots := nodes values select: [ :n |n isRoot ].
	self assert: roots size = 1.
	^ roots first
]

{ #category : #'as yet unclassified' }
Vespucci >> loadContentionTreeFromJsonStream: aStream [
	^ self loadContentionTree: (self loadHullsFromJsonStream: aStream)
]

{ #category : #'as yet unclassified' }
Vespucci >> loadHullsFromJsonStream: aStream [
	| hulls |
	hulls := (STONJSON fromStream: aStream)
		collectWithIndex: [ :rectangles : idx | 
			| boundaries |
			boundaries := rectangles collect: [ :point | (point collect: [ :a | a first @ a second ]) first ].
			VSHull id: idx origin: boundaries first corner: boundaries second ].
	^ hulls
]

{ #category : #'as yet unclassified' }
Vespucci >> node: nodes for: aHull [
	^ nodes at: aHull ifAbsentPut: [ 
		VSNode new id: aHull id; yourself. 
	]
]
