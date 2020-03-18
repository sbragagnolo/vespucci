Class {
	#name : #VSBoxVerticalLayout,
	#superclass : #VSBoxComposedLayout,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSBoxVerticalLayout >> boundingBoxFor: aVSBoxHorizontalLayout [ 
| box index subbox | 
	box := self boundingBox.
	index := (children indexOf: aVSBoxHorizontalLayout) - 1.
	subbox := VSBoundingBox new.
	subbox origin:  box origin x @ (index * (box extent y // children size)) .
	subbox corner: (box corner x  )@ ( ((index+1) * (box extent y // children size))  ).
	^ subbox 

]

{ #category : #'as yet unclassified' }
VSBoxVerticalLayout >> calculateExtentFor: aVSNode [
	| extent |
	extent := self boundingBox extent.
	^ (extent x @ (extent y / content size) )
]

{ #category : #'as yet unclassified' }
VSBoxVerticalLayout >> calculateTopLeftFor: aVSNode [
	| position index box | 
	box := self boundingBox.
	position := (content detect: [ :c | c itLaysOut: aVSNode  ]).
	index := (content indexOf: position) - 1.
	^  box origin x @ (box origin y + (index * (box extent y // content size)) )
	
]

{ #category : #initialization }
VSBoxVerticalLayout >> newChild [
	| child |
	child := self newHorizontal.
	children add: child.
	^ child
]
