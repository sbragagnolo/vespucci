Class {
	#name : #VSComparison,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'metrics'
	],
	#category : #'Vespucci-API'
}

{ #category : #'as yet unclassified' }
VSComparison >> left: aVSMetricComparableUnit [ 
	left := aVSMetricComparableUnit
]

{ #category : #'as yet unclassified' }
VSComparison >> metrics: aCollection [ 
	metrics := aCollection
]

{ #category : #'as yet unclassified' }
VSComparison >> right: aVSMetricComparableUnit [ 
	right := aVSMetricComparableUnit
]
