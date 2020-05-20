Class {
	#name : #VespucciManifest,
	#superclass : #PackageManifest,
	#category : #'Vespucci-Algorithm'
}

{ #category : #'as yet unclassified' }
VespucciManifest class >> playground1 [ 
"hulls := (STONJSON fromStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream ) .

rect := 
hulls
		collect: [ :rectangles | | boundaries | 
			boundaries := rectangles collect: [ : point | (point collect: [ :a | (a first) @ (a second) ]) first ].
			Rectangle origin: (boundaries first) corner: (boundaries second) 
			
			 ].
		
container := Morph new .
container color: Color transparent.

rect collect: [ : a | Morph new topLeft: a origin; extent: a extent ; color: (Color black alpha: 0.2)  ] thenDo:[ : m |  
container addMorph: m  ].

layoutRelative := (Vespucci createRelativeLayoutRepresentationForJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream ) .

layout := (Vespucci createAbsoluteLayoutRepresentationForJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream )  .

boxed := (Vespucci createBoxedLayoutRepresentationForJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream )  .
boxed createMorphFor: tree extent: 1000@887.

tree :=  (Vespucci loadContentionTreeFromJsonStream: '/Users/sbragagn/Downloads/result.json' asFileReference readStream )  .
layout createMorphFor: tree extent: 10@10 .

layoutRelative createMorphFor: tree extent: 10@10 .
layoutRelative extent: (tree children select: [: t | t isLeaf not ] ) anyOne children anyOne.
Vespucci compareAll



Vespucci compareUnitWithItSelf:  '/Users/sbragagn/Downloads/result.json' asFileReference readStream 

"
]

{ #category : #'as yet unclassified' }
VespucciManifest class >> playground2 [ 
"form := ImageReadWriter formFromFileNamed: '/Users/sbragagn/git-papers/2020-guimigrationvalidation-benoit/figures/uiDesk/BWoriginal.png'.
form2 := ImageReadWriter formFromFileNamed: '/Users/sbragagn/git-papers/2020-guimigrationvalidation-benoit/figures/uiDesk/BWGreyBox.png'.

form3 := ImageReadWriter formFromFileNamed: '/Users/sbragagn/git-papers/2020-guimigrationvalidation-benoit/figures/uiDesk/BWoriginal.png'.

grey := form colorAt: 50@50.
points := 0.
wrongs := 0. 
1 to: form width do: [  : x | 
	1 to: form height do: [ : y |
		points := points + 1.
		(form colorAt: (x@y)) = (form2 colorAt: (x@y)) ifTrue: [ 
			form3 colorAt: (x@y) put: Color white. 
		] ifFalse: [ wrongs :=  wrongs+1.	form3 colorAt: (x@y) put: Color red.  ]
		 ]
	 ].

(wrongs / points ) asFloat 
 ""0.0513078957553864""
 ""5.13078957553864""form3 writePNGFileNamed:'/Users/sbragagn/git-papers/2020-guimigrationvalidation-benoit/figures/uiDesk/BWGreyBoxCompare.png'.
"
]
