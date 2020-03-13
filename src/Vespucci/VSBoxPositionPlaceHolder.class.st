"
This is the type used for organizing the content inside a box layout
"
Class {
	#name : #VSBoxPositionPlaceHolder,
	#superclass : #VSAbstractPosition,
	#instVars : [
		'padding',
		'margin'
	],
	#category : #Vespucci
}

{ #category : #initialization }
VSBoxPositionPlaceHolder >> initialize [
	super initialize.
	padding := VSBoundingBox zero.
	margin := VSBoundingBox zero.
]
