"
The general abstract layout represents the layout. it provides some template methods and uniforms the API.
"
Class {
	#name : #VSAbstractLayout,
	#superclass : #Object,
	#category : #'Vespucci-Core'
}

{ #category : #'as yet unclassified' }
VSAbstractLayout >> createMorphFor: aTree extent: anExtent [
	| container |
	container := Morph new.
	container extent: anExtent.
	container color: Color transparent.
	container addMorph: (aTree createMorphWithLayout: self ).
	^ container
]

{ #category : #'as yet unclassified' }
VSAbstractLayout >> extent: aNode [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
VSAbstractLayout >> topLeft: aNode [
	^ self subclassResponsibility 
]
