"
Absolute layout relies directly in the loaded hull, asking for it's information
"
Class {
	#name : #VSAbsoluteLayout,
	#superclass : #VSAbstractLayout,
	#instVars : [
		'dispositions'
	],
	#category : #'Vespucci-Layout'
}

{ #category : #'as yet unclassified' }
VSAbsoluteLayout >> difference: aVSAbsoluteLayout [
	| newDispos |
	newDispos := OrderedCollection new.
	(dispositions asOrderedCollection , aVSAbsoluteLayout dispositions
		groupedBy: [ :a | a id ])
		valuesDo: [ :inId | 
			inId size = 1
				ifTrue: [ newDispos add: inId first ]
				ifFalse: [ inId first = inId second
						ifFalse: [ newDispos addAll: inId second ] ] ].
	^ newDispos
		ifEmpty: [ VSEmptyNode instance ]
		ifNotEmpty: [ self class new
				dispositions: newDispos;
				yourself ]
]

{ #category : #'as yet unclassified' }
VSAbsoluteLayout >> dispositions [
	^ dispositions
]

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
