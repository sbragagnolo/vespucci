Class {
	#name : #VSAbsoluteDisposition,
	#superclass : #Object,
	#instVars : [
		'id',
		'origin',
		'corner'
	],
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> corner: aPoint [ 
	corner := aPoint
]

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> extentFor: aContent [
	self assert: (self itLaysOut: aContent ).
	^ self privateExtent
]

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> id: anInteger [ 
	id := anInteger
]

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> itLaysOut: aNode [
	^ aNode id = id 
]

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> origin: aPoint [ 
	origin := aPoint
]

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> privateExtent [
	^ corner - origin
]

{ #category : #'as yet unclassified' }
VSAbsoluteDisposition >> topLeftFor: aContent [
	self assert: (self itLaysOut: aContent ).
	^ origin
]
