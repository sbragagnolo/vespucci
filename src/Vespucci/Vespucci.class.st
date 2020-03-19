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
	#category : #'Vespucci-API'
}

{ #category : #'as yet unclassified' }
Vespucci class >> createAbsoluteLayoutRepresentationForJsonStream: aStream [
	^ VSCalculateLayoutFromJSONStream absoluteLayout: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createBoxedLayoutRepresentationForJsonStream: aStream [
	^ VSCalculateLayoutFromJSONStream boxLayout: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createRelativeLayoutRepresentationForJsonStream: aStream [
	^ VSCalculateLayoutFromJSONStream relativeLayout: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> loadContentionTreeFromJsonStream: aStream [
	^ VSCreateNodeFromHull execute: (VSLoadHullsFromJSONStream execute: aStream)
]
