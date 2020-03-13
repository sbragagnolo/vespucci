"
a Hull is a shell tagged with an id, or component, or what ever that we can treat as a rectangular black box. 
Ww do not use rectangle because it happens to be a too complex class and we need some specific small behaviours
"
Class {
	#name : #VSHull,
	#superclass : #VSBoundingBox,
	#instVars : [
		'id'
	],
	#category : #Vespucci
}

{ #category : #'instance creation' }
VSHull class >> id: anId origin: from corner: to [
	^ (self origin: from corner: to)
		id: anId;
		yourself
]

{ #category : #comparing }
VSHull >> id [
	^ id
]

{ #category : #comparing }
VSHull >> id: anId [
	id := anId
]
