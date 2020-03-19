"
Calculates a tipical box (horizontal / vertical layout)
"
Class {
	#name : #VSCalculateBoxLayoutFromHullsAndTree,
	#superclass : #VSAlgorithm,
	#category : #Vespucci
}

{ #category : #running }
VSCalculateBoxLayoutFromHullsAndTree >> calculateBestFirstLayoutFor: hulls [  
	| horizontal vertical |
	vertical := horizontal := 0 .
	
	1 to: hulls size do: [ : i  | 
		i to: hulls size do: [ : j |
			((hulls at: i) overlapsOnXWith: (hulls at:j)	) ifTrue: [ 
					vertical := vertical +1  
			].	
			((hulls at: i) overlapsOnYWith: (hulls at:j)	) ifTrue: [ 
					horizontal := horizontal +1  
			].
		 ]
		].
	^ vertical > horizontal ifTrue: [ 
			VSBoxVerticalLayout new  
		] ifFalse:[ 
			VSBoxHorizontalLayout new  
		]
]

{ #category : #running }
VSCalculateBoxLayoutFromHullsAndTree >> clusterize: tree with: hulls into: current [
	| clusters |
	clusters := OrderedCollection new.
	
	
	
	tree isLeaf
		ifFalse: [ | workingWith |
			workingWith := self select: hulls forLevel: tree.
			workingWith 	do: [ :h | 
			| cluster |
			cluster := clusters detect:
							[ :c | c anySatisfy: [ :sample | sample overlapsOnYWith: h ] ]
						ifNone: [ cluster := OrderedCollection new.
							clusters add: cluster.
							cluster ].
					cluster add: h ] ].
	clusters
		do: [ : cluster | 
			| lay  subtree |
			lay := current newChild.
			cluster
				do: [ :h | 
					subtree := tree children detect: [ : c | c id = h id ].
					
					self clusterize: subtree with: hulls  into: lay. 
					lay
						addContentHolder:
							(VSBoxPositionPlaceHolder new
								id: h id;
								yourself) ] ]
						
					
				
			
		
	




]

{ #category : #running }
VSCalculateBoxLayoutFromHullsAndTree >> privateExecute: aTuple [
	| hulls tree current |
	hulls := aTuple first.
	tree := aTuple second.
	current := self calculateBestFirstLayoutFor: ( self select: hulls forLevel: tree ).
.	current
		addContentHolder:
			(VSBoxPositionPlaceHolder new
				id: tree id;
				yourself).
	self clusterize: tree with: hulls into: current.
	^ current
]

{ #category : #running }
VSCalculateBoxLayoutFromHullsAndTree >> select: hulls forLevel: tree [
	^ hulls select: [ :h | tree children anySatisfy: [ :n | n id = h id ] ]
]
