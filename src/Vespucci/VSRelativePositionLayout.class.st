"
Relative position layout, based on the layout of the parent + relative .
This case is really specific, since it gets into account the fact that our underlying representation is the VSHull, what is mean to be expressed as absolute positions. 
We may need to changethis if the VSHulls are relative. 
"
Class {
	#name : #VSRelativePositionLayout,
	#superclass : #VSAbsoluteLayout,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSRelativePositionLayout >> colorFor: aVSNode [
	^ Color
		fromString: (Color registeredColorNames at: aVSNode distanceToRoot + 3)
]

{ #category : #'as yet unclassified' }
VSRelativePositionLayout >> createMorphFor: aTree extent: anExtent [
	| container |
	container := super createMorphFor: aTree extent: anExtent.
	aTree acceptBlock: [ : n |
		 | connecting |
		 n parent ifNotNil:[
			connecting := LineMorph from: (self topLeft:n parent ) to: (self topLeft:n ) color: (self colorFor: n) width: 2. 
			container addMorph: connecting.
		]  
	].
^ container
]

{ #category : #'as yet unclassified' }
VSRelativePositionLayout >> extent: aNode [
	^ aNode isRoot
		ifFalse: [ (self extent: aNode parent) + (super extent: aNode) ]
		ifTrue: [ super extent: aNode ]
]

{ #category : #'as yet unclassified' }
VSRelativePositionLayout >> topLeft: aNode [
	^ aNode isRoot
		ifFalse: [ (self topLeft: aNode parent) + (super topLeft: aNode) ]
		ifTrue: [ super topLeft: aNode ]
]
