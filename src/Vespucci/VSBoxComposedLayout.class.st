Class {
	#name : #VSBoxComposedLayout,
	#superclass : #VSAbstractLayout,
	#instVars : [
		'children'
	],
	#category : #Vespucci
}

{ #category : #initialization }
VSBoxComposedLayout >> adaptNode: aNode [ 
	
]

{ #category : #initialization }
VSBoxComposedLayout >> newChild [
	self subclassResponsibility 
]

{ #category : #initialization }
VSBoxComposedLayout >> newHorizontal [
	^ VSBoxHorizontalLayout new
]

{ #category : #initialization }
VSBoxComposedLayout >> newVertical [
 	^ VSBoxVerticalLayout new
]
