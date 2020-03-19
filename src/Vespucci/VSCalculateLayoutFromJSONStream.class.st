"
Put together to other algorithms, since some intermediate values are reused.
"
Class {
	#name : #VSCalculateLayoutFromJSONStream,
	#superclass : #VSAlgorithm,
	#instVars : [
		'composedAlgorithm'
	],
	#category : #Vespucci
}

{ #category : #'as yet unclassified' }
VSCalculateLayoutFromJSONStream class >> absoluteLayout: aStream [
	^ self new
		layoutAlgorithm: VSCalculateAbsoluteLayoutFromHullsAndTree new;
		execute: aStream
]

{ #category : #'as yet unclassified' }
VSCalculateLayoutFromJSONStream class >> boxLayout: aStream [
	^ self new
		layoutAlgorithm: VSCalculateBoxLayoutFromHullsAndTree new;
		execute: aStream
]

{ #category : #'as yet unclassified' }
VSCalculateLayoutFromJSONStream class >> execute: aParameter [
	self error: 'This is a partial algorithm. I requires to set a layoting algorithm . use some of the other class methods'
]

{ #category : #'as yet unclassified' }
VSCalculateLayoutFromJSONStream class >> relativeLayout: aStream [
	^ self new
		layoutAlgorithm: VSCalculateRelativeLayoutFromHullsAndTree new;
		execute: aStream
]

{ #category : #'as yet unclassified' }
VSCalculateLayoutFromJSONStream >> layoutAlgorithm: anAlgo [
	composedAlgorithm := anAlgo
]

{ #category : #running }
VSCalculateLayoutFromJSONStream >> privateExecute: aStream [
	| tree hulls |
	hulls := VSLoadHullsFromJSONStream execute: aStream.
	tree := VSCreateNodeFromHull execute: hulls.
	
	^ composedAlgorithm execute: 	{ hulls.tree }
]
