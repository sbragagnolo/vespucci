"
Load hulls from a json created in base of the contours extracted by OpenCV
"
Class {
	#name : #VSLoadHullsFromJson,
	#superclass : #VSAlgorithm,
	#category : #Vespucci
}

{ #category : #running }
VSLoadHullsFromJson >> privateExecute: aStream [
	| hulls |
	hulls := (STONJSON fromStream: aStream)
		collectWithIndex: [ :rectangles : idx | 
			| boundaries |
			boundaries := rectangles collect: [ :point | (point collect: [ :a | a first @ a second ]) first ].
			VSHull id: idx origin: boundaries first corner: boundaries second ].
	^ hulls
]
