Class {
	#name : 'Binary',
	#superclass : 'Object',
	#category : 'Exercise@Binary',
	#package : 'Exercise@Binary'
}

{ #category : 'converting' }
Binary >> decimalFromBinary: binary [

	| base |
	base := 2 raisedTo: binary size.

	^ binary \ '01'
		  ifNotEmpty: [ nil ]
		  ifEmpty: [
		  binary sumNumbers: [ :bit | bit digitValue * (base := base / 2) ] ]
]
