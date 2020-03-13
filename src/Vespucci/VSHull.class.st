"
a Hull is a shell, or component, or what ever that we can treat as a rectangular black box. 
Ww do not use rectangle because it happens to be a too complex class and we need some specific small behaviours
"
Class {
	#name : #VSHull,
	#superclass : #Object,
	#instVars : [
		'id',
		'origin',
		'corner'
	],
	#category : #Vespucci
}

{ #category : #'instance creation' }
VSHull class >> id: anId origin: from corner: to [
	| origin corner |
	origin := (from x min: to x) @ (from y min: to y).
	corner := (from x max: to x) @ (from y max: to y).
	^ self new
		origin: origin;
		corner: corner;
		id: anId;
		yourself
]

{ #category : #'as yet unclassified' }
VSHull >> area [
	| w |
	(w := self width) <= 0 ifTrue: [ ^ 0 ].
	^ w * self height max: 0
]

{ #category : #'as yet unclassified' }
VSHull >> contains: aVSHull [
	^ aVSHull origin >= origin and: [ aVSHull corner <= corner ]
]

{ #category : #accessing }
VSHull >> corner [
	^ corner
]

{ #category : #'as yet unclassified' }
VSHull >> corner: aPoint [ 
	corner := aPoint
]

{ #category : #'as yet unclassified' }
VSHull >> extent [
	^ corner - origin
]

{ #category : #'as yet unclassified' }
VSHull >> height [
	^ corner y - origin y
]

{ #category : #comparing }
VSHull >> id [
	^ id
]

{ #category : #comparing }
VSHull >> id: anId [
	id := anId
]

{ #category : #comparing }
VSHull >> min: aVSHull [
	| thisArea thatArea| 
	
	thisArea := self area.
	thatArea := aVSHull area.
	
	thisArea <  thatArea ifTrue: [ 
		^ self 
	]. 
	thisArea > thatArea ifTrue: [
		^ aVSHull  
	].
	self = aVSHull ifTrue: [ ^ self ].
	
	self error: ' Not sure what to do here '
]

{ #category : #'as yet unclassified' }
VSHull >> origin [
	^ origin
]

{ #category : #'as yet unclassified' }
VSHull >> origin: aPoint [ 
	origin := aPoint
]

{ #category : #'as yet unclassified' }
VSHull >> printOn: aStream [
	origin printOn: aStream.
	aStream nextPutAll: '::'.
	corner printOn: aStream
]

{ #category : #'as yet unclassified' }
VSHull >> width [
	^ corner x - origin x
]
