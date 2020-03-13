"
G o F () FoG()
"
Class {
	#name : #VSCompose,
	#superclass : #VSAlgorithm,
	#instVars : [
		'outter',
		'inner'
	],
	#category : #Vespucci
}

{ #category : #running }
VSCompose >> inner: anAlgo [
	inner := anAlgo
]

{ #category : #running }
VSCompose >> outter: anAlgo [
	outter := anAlgo
]

{ #category : #running }
VSCompose >> privateExecute: aParameter [

	^ outter execute: (inner execute: aParameter)
]
