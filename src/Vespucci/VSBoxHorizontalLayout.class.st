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
	
	subbox origin: (subbox origin + margin origin).
	subbox corner: (subbox corner - margin corner).
	^ subbox 
]

{ #category : #'as yet unclassified' }
VSBoxHorizontalLayout >> calculateExtentFor: aVSNode [
	| extent box position |
	box := self boundingBox.
	position := content detect: [ :c | c itLaysOut: aVSNode ].
	box origin: box origin + position padding origin.
	box corner: box corner - position padding corner.
	extent := box extent.
	^ (extent x / content size) @ extent y - 1
]

{ #category : #'as yet unclassified' }
VSBoxHorizontalLayout >> calculateTopLeftFor: aVSNode [
	| position index box |
	box := self boundingBox.
	position := content detect: [ :c | c itLaysOut: aVSNode ].
	index := (content indexOf: position) - 1.
	^ ((box origin x + (index * (box extent x / content size)))
		@ box origin y) + position padding origin
]

{ #category : #initialization }
VSBoxHorizontalLayout >> isHorizontal [
	^ true
]

{ #category : #initialization }
VSBoxHorizontalLayout >> newChild [
	| child |
	child := self newVertical.
	children add: child.
	^ child
]
