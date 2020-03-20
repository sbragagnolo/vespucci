"
The position object is mean to act as a place holder of the object to draw. 
In this framework we cannot afford the thing to draw to have a layout, since we want to test many possible layouts for the same objects. 
So, instead, we recognice the placement inside the layout
"
Class {
	#name : #VSAbstractPosition,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'Vespucci-Layout'
}

{ #category : #'as yet unclassified' }
VSAbstractPosition >> id [
	^ id
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> id: anInteger [ 
	id := anInteger
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> itLaysOut: aNode [
	^ aNode id = id 
]
