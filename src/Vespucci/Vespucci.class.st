"
hulls := (STONJSON fromStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream ) .

rect := 
hulls
		collect: [ :rectangles | | boundaries | 
			boundaries := rectangles collect: [ : point | (point collect: [ :a | (a first) @ (a second) ]) first ].
			Rectangle origin: (boundaries first) corner: (boundaries second) 
			
			 ].
		
container := Morph new .
container color: Color transparent.

rect collect: [ : a | Morph new topLeft: a origin; extent: a extent ; color: (Color black alpha: 0.2)  ] thenDo:[ : m |  
container addMorph: m  ].

layoutRelative := (Vespucci createRelativeLayoutRepresentationForJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream ) .

layout := (Vespucci createAbsoluteLayoutRepresentationForJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream )  .
tree :=  (Vespucci loadContentionTreeFromJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream )  .
layout createMorphFor: tree.

layoutRelative createMorphFor: tree.
layoutRelative extent: (tree children select: [: t | t isLeaf not ] ) anyOne children anyOne


"
Class {
	#name : #Vespucci,
	#superclass : #Object,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
Vespucci class >> createAbsoluteLayoutRepresentationForJsonStream: aStream [
	^ VSAbsoluteLayout new
		dispositions:
			((VSFromHullToAbsoluteDisposition compose: VSLoadHullsFromJson) execute: aStream);
		yourself
]

{ #category : #'as yet unclassified' }
Vespucci class >> createBoxedLayoutRepresentationForJsonStream: aStream [
	^ self new createBoxedLayoutRepresentationForJsonStream: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createRelativeLayoutRepresentationForJsonStream: aStream [
	^ VSRelativePositionLayout new
		dispositions: (VSRelativeDispositionFromStream execute: aStream);
		yourself
]

{ #category : #'as yet unclassified' }
Vespucci class >> loadContentionTreeFromJsonStream: aStream [
	^ VSFromHullToNode execute: (VSLoadHullsFromJson execute: aStream)
]

{ #category : #'as yet unclassified' }
Vespucci >> clusterize: tree with: hulls into: current [
	| clusters |
	clusters := OrderedCollection new.
	tree isLeaf
		ifFalse: [ | workingWith |
			workingWith := hulls 	select: [ : h | tree children contains: [ :n | n id = h id ] ].
			workingWith 	do: [ :h | 
			| cluster |
			cluster := clusters detect:
							[ :c | c anySatisfy: [ :sample | sample overlapsOnYWith: h ] ]
						ifNone: [ cluster := OrderedCollection new.
							clusters add: cluster.
							cluster ].
					cluster add: h ] ].
	clusters
		do: [ : cluster | 
			| lay  subtree |
			lay := current newChild.
			cluster
				do: [ :h | 
					subtree := tree children detect: [ : c | c id = h id ].
					
					self clusterize: subtree with: hulls  into: lay. 
					lay
						addContentHolder:
							(VSBoxPositionPlaceHolder new
								id: h id;
								yourself) ] ]
						
					
				
			
		
	




]

{ #category : #'as yet unclassified' }
Vespucci >> createBoxedLayoutRepresentationForJsonStream: aStream [
	| tree hulls current |
	hulls := (VSLoadHullsFromJson execute: aStream) reverse.
	tree := VSFromHullToNode execute: hulls.
	current := VSBoxVerticalLayout new.
	current
		addContentHolder:
			(VSBoxPositionPlaceHolder new
				id: tree id;
				yourself).
	self clusterize: tree with: hulls into: current.
	^ current
]
