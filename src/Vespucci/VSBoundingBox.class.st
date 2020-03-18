"
Represents a rectangular shape. This class is just simpler than rectangle, and with domain meethods
"
Class {
	#name : #VSBoundingBox,
	#superclass : #Object,
	#instVars : [
		'origin',
		'corner'
	],
	#category : #Vespucci
}

{ #category : #'instance creation' }
VSBoundingBox class >> marginOne [
	^ self origin: 1 @ 1 corner: 1 @ 1
]

{ #category : #'instance creation' }
VSBoundingBox class >> marginTen [
	^ self origin: 10 @ 10 corner: 10 @ 10
]

{ #category : #'instance creation' }
VSBoundingBox class >> origin: from corner: to [
	| origin corner |
	origin := (from x min: to x) @ (from y min: to y).
	corner := (from x max: to x) @ (from y max: to y).
	^ self new
		origin: origin;
		corner: corner;
		yourself
]

{ #category : #'instance creation' }
VSBoundingBox class >> zero [
	^ self origin: 0 @ 0 corner: 0 @ 0
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> area [
	| w |
	(w := self width) <= 0 ifTrue: [ ^ 0 ].
	^ w * self height max: 0
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> boundingBoxFor: aSubLayout [  
	^ self
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> contains: aBox [
	^ aBox origin >= origin and: [ aBox corner <= corner ]
]

{ #category : #accessing }
VSBoundingBox >> corner [
	^ corner
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> corner: aPoint [ 
	corner := aPoint
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> extent [
	^ corner - origin
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> height [
	^ corner y - origin y
]

{ #category : #comparing }
VSBoundingBox >> min: aBox [
	| thisArea thatArea| 
	
	thisArea := self area.
	thatArea := aBox area.
	
	thisArea <  thatArea ifTrue: [ 
		^ self 
	]. 
	thisArea > thatArea ifTrue: [
		^ aBox  
	].
	self = aBox ifTrue: [ ^ self ].
	
	self error: ' Not sure what to do here '
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> origin [
	^ origin
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> origin: aPoint [ 
	origin := aPoint
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> overlapsOnXWith: anOtherBox [
	^ (anOtherBox origin x between: origin x and: corner x)
		or: [ anOtherBox corner x between: origin x and: corner x ]
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> overlapsOnYWith: anOtherBox [
	^ (anOtherBox origin y between: origin y and: corner y)
		or: [ anOtherBox corner y between: origin y and: corner y ]
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> printOn: aStream [
	aStream nextPutAll: 'VBox'.
	origin printOn: aStream.
	aStream nextPutAll: '::'.
	corner printOn: aStream
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> width [
	^ corner x - origin x
]
