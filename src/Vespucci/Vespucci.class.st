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
Vespucci class >> compareAll [
	| units | 
	units := self loadUnits.
	^ (units at:#Angular) flatCollect: [ : a | 
		(units at:#GWT) collect: [ : gwt | 
			self metricsFor: a and: gwt
		]
	 ] 
]

{ #category : #'as yet unclassified' }
Vespucci class >> compareUnitWithItSelf: aStream [
	| unit |
	unit := self createComparableUnit: aStream.
	^ self metricsFor: unit and: unit 
]

{ #category : #'as yet unclassified' }
Vespucci class >> createAbsoluteLayoutRepresentationForJsonStream: aStream [
	^ VSCalculateLayoutFromJSONStream absoluteLayout: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createBoxedLayoutRepresentationForJsonStream: aStream [
	^ VSCalculateLayoutFromJSONStream boxLayout: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createComparableUnit: aStream [
	^ VSCalculateComparableUnitFromJSONStream execute: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> createRelativeLayoutRepresentationForJsonStream: aStream [
	^ VSCalculateLayoutFromJSONStream relativeLayout: aStream
]

{ #category : #'as yet unclassified' }
Vespucci class >> loadContentionTreeFromJsonStream: aStream [
	^ VSCreateNodeFromHull execute: (VSLoadHullsFromJSONStream execute: aStream)
]

{ #category : #'as yet unclassified' }
Vespucci class >> loadUnits [
	| dic |
	dic := Dictionary new. 
	dic at: #Angular put:
	(('pharo-local' asFileReference / #iceberg/ #sbragagnolo /#vespucci / #resources/#MigrationImages / #AngularRslt ) entries collect: [ : f | 
		| ref unit | 
		ref := f asFileReference.
		unit := Vespucci createComparableUnit: ref readStream.
		unit image: ((ref parent parent /#Angular / ref basename) fullName copyReplaceAll:'.json' with: '') asFileReference .
		unit
	]).
	dic at: #GWT put:
	(('pharo-local' asFileReference / #iceberg/ #sbragagnolo /#vespucci / #resources/#MigrationImages / #GWTRslt ) entries collect: [ : f | 
		| ref unit | 
		ref := f asFileReference.
		unit := Vespucci createComparableUnit: ref readStream.
		unit image: ((ref parent parent /#GWT / ref basename) fullName copyReplaceAll:'.json' with: '') asFileReference .
		unit
	]).
^ dic
]

{ #category : #'as yet unclassified' }
Vespucci class >> metricsFor: aUnit and: anOtherUnit [
	| c |
	c := VSComparison new.
	c left: aUnit. 
	c right: anOtherUnit .
	c metrics: (VSMetrics allSubclasses
		collect: [ :m | 
			| metric |
			metric := m new.
			metric -> (metric compare: aUnit with: anOtherUnit) ]).
	^ c
]
