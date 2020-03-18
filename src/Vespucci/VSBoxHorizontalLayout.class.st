Class {
	#name : #VSBoxHorizontalLayout,
	#superclass : #VSBoxComposedLayout,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSBoxHorizontalLayout >> boundingBoxFor: aVSBoxVerticalLayout [ 
	| box index subbox | 
	box := self boundingBox.
	index := (children indexOf: aVSBoxVerticalLayout) - 1.
	subbox := VSBoundingBox new.
	
	subbox origin:  (box origin x + (index * (box extent x / children size))  ) @  (box origin y).
	subbox corner:( ((index+1) * (box extent x / children size)) ) @  (box corner y  ).
	^ subbox 
]

{ #category : #'as yet unclassified' }
VSBoxHorizontalLayout >> calculateExtentFor: aVSNode [
	| extent |
	extent := self boundingBox extent.
	^ ((extent x / content size) @ extent y) - 1
]

{ #category : #'as yet unclassified' }
VSBoxHorizontalLayout >> calculateTopLeftFor: aVSNode [
	| position index box | 
	box := self boundingBox.
	position := (content detect: [ :c | c itLaysOut: aVSNode  ]).
	index := (content indexOf: position) - 1.
	^ (box origin x + (index * (box extent x / content size)) ) @  box origin y 
	
]

{ #category : #initialization }
VSBoxHorizontalLayout >> newChild [
	| child |
	child := self newVertical.
	children add: child.
	^ child
]
