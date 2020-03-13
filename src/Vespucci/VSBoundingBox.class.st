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
VSBoundingBox class >> zero [
	^ self new
		origin: 0 @ 0;
		corner: 0 @ 0;
		yourself
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> area [
	| w |
	(w := self width) <= 0 ifTrue: [ ^ 0 ].
	^ w * self height max: 0
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
VSBoundingBox >> printOn: aStream [
	origin printOn: aStream.
	aStream nextPutAll: '::'.
	corner printOn: aStream
]

{ #category : #'as yet unclassified' }
VSBoundingBox >> width [
	^ corner x - origin x
]
