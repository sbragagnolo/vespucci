"
Put together to other algorithms, since some intermediate values are reused.
"
Class {
	#name : #VSRelativeDispositionFromStream,
	#superclass : #VSAlgorithm,
	#category : #Vespucci
}

{ #category : #running }
VSRelativeDispositionFromStream >> privateExecute: aStream [
	| tree hulls |
	hulls := VSLoadHullsFromJson execute: aStream.
	tree := VSFromHullToNode execute: hulls.
	^ VSRelativeDispositionFromHullsAndTree execute: 	{ hulls.tree }
]
