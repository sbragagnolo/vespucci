"
Represents a position this position is based on numerical information, not in relationships.
"
Class {
	#name : #VSAbsolutePosition,
	#superclass : #VSAbstractPosition,
	#instVars : [
		'origin',
		'corner'
	],
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> corner: aPoint [ 
	corner := aPoint
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> origin: aPoint [ 
	origin := aPoint
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> privateExtent [
	^ corner - origin
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> privateTopLeft [
	^ origin
]
