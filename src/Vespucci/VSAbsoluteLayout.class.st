"
Absolute layout relies directly in the loaded hull, asking for it's information
"
Class {
	#name : #VSAbsoluteLayout,
	#superclass : #VSAbstractLayout,
	#instVars : [
		'dispositions'
	],
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSAbsoluteLayout >> dispositions: aCollection [ 
	dispositions := aCollection
]

{ #category : #'as yet unclassified' }
VSAbsoluteLayout >> extent: aNode [
	^ dispositions
		detect: [ :d | d itLaysOut: aNode ]
		ifFound: [ :f | f extentFor: aNode ]
		ifNone: [ 0 @ 0 ]
]

{ #category : #'as yet unclassified' }
VSAbsoluteLayout >> topLeft: aNode [
	^ dispositions
		detect: [ :d | d itLaysOut: aNode ]
		ifFound: [ :f | f topLeftFor: aNode ]
		ifNone: [ 0 @ 0 ]
]
