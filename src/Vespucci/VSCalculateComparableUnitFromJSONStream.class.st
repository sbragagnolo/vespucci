"
This algorithm just puts together some of the existing ones for building an object that we can use for comparing and build up metrics.
"
Class {
	#name : #VSCalculateComparableUnitFromJSONStream,
	#superclass : #VSAlgorithm,
	#category : #'Vespucci-Algorithm'
}

{ #category : #running }
VSCalculateComparableUnitFromJSONStream >> privateExecute: aStream [
	| unit |
	unit := VSMetricComparableUnit new. 
	unit hulls:( VSLoadHullsFromJSONStream execute: aStream).
	unit tree: (VSCreateNodeFromHull execute: unit hulls).
	unit boxLayout: (VSCalculateBoxLayoutFromHullsAndTree execute: { unit hulls . unit tree }).
	unit relativeLayout:  (VSCalculateRelativeLayoutFromHullsAndTree execute: { unit hulls . unit tree }).
	unit absoluteLayout:  (VSCalculateAbsoluteLayoutFromHullsAndTree execute: { unit hulls . unit tree }).
	
	^ unit
]
