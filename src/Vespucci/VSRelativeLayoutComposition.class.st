Class {
	#name : #VSRelativeLayoutComposition,
	#superclass : #VSMetrics,
	#category : #'Vespucci-Metrics'
}

{ #category : #testing }
VSRelativeLayoutComposition >> compare: aUnit with: otherUnit [
	^ (aUnit relativeLayout difference: otherUnit relativeLayout)
		dispositions size / aUnit relativeLayout dispositions size
		+ otherUnit relativeLayout dispositions size
]

{ #category : #testing }
VSRelativeLayoutComposition >> name [
	^ 'Relative layout composition'
]
