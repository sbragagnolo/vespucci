"
Maybe to be called command 
"
Class {
	#name : #VSAlgorithm,
	#superclass : #Object,
	#instVars : [
		'lastParameter',
		'lastValue'
	],
	#category : #Vespucci
}

{ #category : #running }
VSAlgorithm class >> compose: anOtherAlgorithm [
	^ self new compose: anOtherAlgorithm new
]

{ #category : #running }
VSAlgorithm class >> execute: aParameter [
	^ self new execute: aParameter
]

{ #category : #'as yet unclassified' }
VSAlgorithm >> compose: anOtherAlgorithm [
	^ VSCompose new
		outter: self;
		inner: anOtherAlgorithm;
		yourself
]

{ #category : #running }
VSAlgorithm >> execute: aParameter [
	lastParameter = aParameter 
		ifTrue: [ ^ lastValue ].
	lastValue := self privateExecute: aParameter.
	lastParameter := aParameter.
	^ lastValue
]

{ #category : #running }
VSAlgorithm >> privateExecute: aParameter [
	^ self subclassResponsibility 
]
