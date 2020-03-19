"
Load hulls from a json created in base of the contours extracted by OpenCV
"
Class {
	#name : #VSLoadHullsFromJSONStream,
	#superclass : #VSAlgorithm,
	#category : #'Vespucci-Algorithm'
}

{ #category : #running }
VSLoadHullsFromJSONStream >> privateExecute: aStream [
	| hulls |
	hulls := (STONJSON fromStream: aStream)
		collectWithIndex: [ :rectangles : idx | 
			| boundaries |
			boundaries := rectangles collect: [ :point | (point collect: [ :a | a first @ a second ]) first ].
			VSHull id: idx origin: boundaries first corner: boundaries second ].
	^ hulls reverse
]
