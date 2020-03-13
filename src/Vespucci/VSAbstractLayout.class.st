"
The general abstract layout represents the layout. it provides some template methods and uniforms the API.
"
Class {
	#name : #VSAbstractLayout,
	#superclass : #Object,
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSAbstractLayout >> createMorphFor: aTree [
	| container |
	container := Morph new.
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
