"
Calculate Absolute disposition based on relative analyis of the contention tree and the given hulls
"
Class {
	#name : #VSCalculateRelativeLayoutFromHullsAndTree,
	#superclass : #VSAlgorithm,
	#category : #'Vespucci-Algorithm'
}

{ #category : #'as yet unclassified' }
VSCalculateRelativeLayoutFromHullsAndTree >> privateExecute: aTuple [ 
	| dispositions hulls tree |

	hulls := aTuple first.
	tree := aTuple second.
	dispositions := OrderedCollection new.
	tree acceptBlock: [ : n | 
		| dispo thisHull parentHull | 
		dispo := VSAbsolutePosition new.
		thisHull := 	hulls detect: [ : h |  h id = n id ].
		parentHull := n isRoot ifTrue: [ nil ] ifFalse: [ hulls detect: [ : h | h id = n parent id  ]	].
		dispo origin: ( thisHull origin -( parentHull ifNil: [0@0 ] ifNotNil: [ parentHull origin]) ).
		dispo corner: ( thisHull corner -( parentHull ifNil: [0@0 ] ifNotNil: [ parentHull corner]) ).
		dispo id: n id.
		dispositions add: dispo 
	].
	^VSRelativePositionLayout new dispositions: dispositions; yourself 
]
