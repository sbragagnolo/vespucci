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
	#category : #'Vespucci-Layout'
}

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> = anOther [
	^self species = anOther species
		and: [ self id = anOther id
				and:
					[ self corner = anOther corner and: [ self origin = anOther origin ] ] ]
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> corner [
	^ corner
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> corner: aPoint [ 
	corner := aPoint
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> extentFor: aContent [
	self assert: (self itLaysOut: aContent ).
	^ corner - origin
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> hash [
	^ id hash bitXor: (corner hash bitXor: origin hash)
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> origin [
	^ origin
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> origin: aPoint [ 
	origin := aPoint
]

{ #category : #'as yet unclassified' }
VSAbsolutePosition >> topLeftFor: aContent [
	self assert: (self itLaysOut: aContent ).
	^ origin
]
