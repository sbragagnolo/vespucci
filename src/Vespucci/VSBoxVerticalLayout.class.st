Class {
	#name : #VSBoxVerticalLayout,
	#superclass : #VSBoxComposedLayout,
	#category : #Vespucci
}

{ #category : #initialization }
VSBoxVerticalLayout >> newChild [
	| child |
	child := self newHorizontal.
	self children add: child.
	^ child
]
