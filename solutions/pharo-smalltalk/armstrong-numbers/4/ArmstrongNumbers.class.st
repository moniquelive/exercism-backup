Class {
	#name : 'ArmstrongNumbers',
	#superclass : 'Object',
	#category : 'Exercise@ArmstrongNumbers',
	#package : 'Exercise@ArmstrongNumbers'
}

{ #category : 'testing' }
ArmstrongNumbers >> isArmstrongNumber: number [

	| numDigits |
	numDigits := number numberOfDigits.

	^ number = ((1 to: numDigits) sumNumbers: [ :each |
		   (number decimalDigitAt: each) raisedTo: numDigits ])
]
