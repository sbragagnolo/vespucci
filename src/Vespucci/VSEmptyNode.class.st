Class {
	#name : #VSEmptyNode,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Vespucci-Core'
}

{ #category : #'as yet unclassified' }
VSEmptyNode class >> instance [
	^ instance ifNil: [  instance := self new ]
]

{ #category : #accessing }
VSEmptyNode >> children: aCollection [
	" nothing inside me "
]

{ #category : #accessing }
VSEmptyNode >> size [
	^ 0
]
