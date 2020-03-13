Class {
	#name : #VSAbstractPosition,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSAbstractPosition >> extentFor: aContent [
	self assert: (self itLaysOut: aContent ).
	^ self privateExtent
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> id: anInteger [ 
	id := anInteger
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> itLaysOut: aNode [
	^ aNode id = id 
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> privateExtent [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> privateTopLeft [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
VSAbstractPosition >> topLeftFor: aContent [
	self assert: (self itLaysOut: aContent ).
	^ self privateTopLeft 
]
