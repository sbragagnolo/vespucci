"
A box layout is one of the dynamic typical configurations. 
Each box arrange the items one after the other, from left to right, or top to down, according to the kind
"
Class {
	#name : #VSBoxComposedLayout,
	#superclass : #VSAbstractLayout,
	#instVars : [
		'margin',
		'parent',
		'children',
		'content'
	],
	#category : #'Vespucci-Layout'
}

{ #category : #initialization }
VSBoxComposedLayout >> adaptNode: aNode [ 
	
]

{ #category : #initialization }
VSBoxComposedLayout >> addContentHolder: aBoxPositionHolder [
	content add: aBoxPositionHolder 
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> boundingBox [
	^ self parent boundingBoxFor: self
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> boundingBoxFor: aVSBoxVerticalLayout [ 
	self subclassResponsibility 
]

{ #category : #initialization }
VSBoxComposedLayout >> createMorphFor: aTree extent: anExtent [
	|  morph |
	^ parent ifNil: [ 
		parent := VSBoundingBox origin: 0 @ 0 corner: anExtent..
		morph := super createMorphFor: aTree extent: anExtent.
		parent := nil.
		 morph 
	] ifNotNil: [ 
	 	super createMorphFor: aTree extent: anExtent.
	]
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> difference: aVSBoxVerticalLayout [ 
	^  VSEmptyNode instance 
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> extent: aVSNode [ 
	^ (self layoutFor: aVSNode) calculateExtentFor: aVSNode
]

{ #category : #initialization }
VSBoxComposedLayout >> initialize [ 
	super initialize. 
	content := OrderedCollection new.
	children := OrderedCollection new.
	margin := VSBoundingBox marginTen.
]

{ #category : #initialization }
VSBoxComposedLayout >> isHorizontal [
	^ false
]

{ #category : #initialization }
VSBoxComposedLayout >> isVertical [
	^ false
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> layoutFor: aVSNode [
	| all | 
	all :=  (self possibleLayoutsFor: aVSNode) .
	all size = 1 ifTrue: [ ^ all first  ].
	self error: ' Nor layout, or many layouts matching the node '. 

]

{ #category : #initialization }
VSBoxComposedLayout >> newChild [
	self subclassResponsibility 
]

{ #category : #initialization }
VSBoxComposedLayout >> newHorizontal [
	^ VSBoxHorizontalLayout new parent: self ; yourself
]

{ #category : #initialization }
VSBoxComposedLayout >> newVertical [
 	^ VSBoxVerticalLayout new parent: self ; yourself
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> parent [
	^ parent
]

{ #category : #accessing }
VSBoxComposedLayout >> parent: aVSBoxHorizontalLayout [ 
	parent := aVSBoxHorizontalLayout
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> possibleLayoutsFor: aVSNode [
	^ ((content anySatisfy: [ :c | c itLaysOut: aVSNode ])
		ifTrue: [ {self} ]
		ifFalse: [ children
				ifEmpty: [ { nil } ]
				ifNotEmpty: [ children flatCollect: [ :c | c possibleLayoutsFor: aVSNode ] ] ]) reject: [ : a | a isNil ]
]

{ #category : #'as yet unclassified' }
VSBoxComposedLayout >> topLeft: aVSNode [
	^ (self layoutFor: aVSNode) calculateTopLeftFor: aVSNode
]
