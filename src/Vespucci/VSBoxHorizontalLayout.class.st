Class {
	#name : #VSBoxHorizontalLayout,
	#superclass : #VSBoxComposedLayout,
	#category : #Vespucci
}

{ #category : #initialization }
VSBoxHorizontalLayout >> newChild [
	| child |
	child := self newVertical.
	self children add: child.
	^ child
]
