"
The node represents a tree. 
This tree is built up from the idea of composition. 
We say that 
"
Class {
	#name : #VSNode,
	#superclass : #Object,
	#instVars : [
		'id',
		'parent',
		'children'
	],
	#category : #'Vespucci-Core'
}

{ #category : #'as yet unclassified' }
VSNode >> acceptBlock: aBlock [
	aBlock value: self.
	self childrenDo: [ :c | c acceptBlock: aBlock ]
]

{ #category : #'as yet unclassified' }
VSNode >> addChild: aVSNode [
	self children add: aVSNode.
	aVSNode parent: self.
]

{ #category : #'as yet unclassified' }
VSNode >> children [
	^ children ifNil: [ children := Set new ]
]

{ #category : #'as yet unclassified' }
VSNode >> childrenDo: aBlockClosure [
	self isLeaf
		ifFalse: [ children  do: [ :a | aBlockClosure value: a ] ]
]

{ #category : #'as yet unclassified' }
VSNode >> createMorphWithLayout: aLayout [
	| thisMorph label |
	thisMorph := Morph new
		topLeft: (aLayout topLeft: self);
		extent: (aLayout extent: self);
		color: (Color black alpha: 0.2).
	label := ((aLayout topLeft: self) asString, ' ID: ', id asString )asMorph
		color: Color cyan;
		topLeft: (aLayout topLeft: self) + (2 @ 5);
		yourself.
	thisMorph addMorph: label.
	self childrenDo: [ :c | thisMorph addMorph:( c createMorphWithLayout: aLayout) ].
	^ thisMorph
]

{ #category : #'as yet unclassified' }
VSNode >> distanceToRoot [
	^ self isRoot
		ifTrue: [ 1 ]
		ifFalse: [ self parent distanceToRoot + 1 ]
]

{ #category : #'aas yet unclassified' }
VSNode >> id [
	^ id
]

{ #category : #'as yet unclassified' }
VSNode >> id: anId [
	id := anId
]

{ #category : #'as yet unclassified' }
VSNode >> isLeaf [
	^ children isEmptyOrNil 
]

{ #category : #'as yet unclassified' }
VSNode >> isRoot [
	^ parent isNil
]

{ #category : #'as yet unclassified' }
VSNode >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
VSNode >> parent: aVSNode [ 
	parent := aVSNode
]
