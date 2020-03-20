Class {
	#name : #VSMetricComparableUnit,
	#superclass : #Object,
	#instVars : [
		'image',
		'hulls',
		'tree',
		'absoluteLayout',
		'relativeLayout',
		'boxLayout'
	],
	#category : #'Vespucci-Core'
}

{ #category : #accessing }
VSMetricComparableUnit >> absoluteLayout [
	^ absoluteLayout
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> absoluteLayout: aVSBoxVerticalLayout [ 
	absoluteLayout := aVSBoxVerticalLayout
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> boxLayout [
	^ boxLayout
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> boxLayout: aVSBoxVerticalLayout [
	boxLayout := aVSBoxVerticalLayout
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> hulls [
	^ hulls
]

{ #category : #accessing }
VSMetricComparableUnit >> hulls: aCollection [ 
	hulls := aCollection
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> relativeLayout [
	^ relativeLayout
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> relativeLayout: aVSBoxVerticalLayout [ 
	relativeLayout := aVSBoxVerticalLayout
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> tree [
	^ tree
]

{ #category : #'as yet unclassified' }
VSMetricComparableUnit >> tree: aVSNode [ 
	tree := aVSNode
]
