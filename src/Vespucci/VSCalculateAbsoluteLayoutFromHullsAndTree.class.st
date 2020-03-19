"
Create Absolute Positioning objects by analyzing hulls
"
Class {
	#name : #VSCalculateAbsoluteLayoutFromHullsAndTree,
	#superclass : #VSAlgorithm,
	#category : #'Vespucci-Algorithm'
}

{ #category : #running }
VSCalculateAbsoluteLayoutFromHullsAndTree >> privateExecute: aTuple [
	| hulls |
	hulls := aTuple first.
	^ VSAbsoluteLayout new
		dispositions:
			(hulls
				collect: [ :h | 
					VSAbsolutePosition new
						origin: h origin;
						corner: h corner;
						id: h id;
						yourself ]);
		yourself
]
