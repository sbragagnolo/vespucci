"
Create Absolute Positioning objects by analyzing hulls
"
Class {
	#name : #VSFromHullToAbsoluteDisposition,
	#superclass : #VSAlgorithm,
	#category : #Vespucci
}

{ #category : #running }
VSFromHullToAbsoluteDisposition >> privateExecute: hulls [
	^ hulls
		collect: [ :h | 
			VSAbsolutePosition new
				origin: h origin;
				corner: h corner;
				id: h id;
				yourself ]
]
