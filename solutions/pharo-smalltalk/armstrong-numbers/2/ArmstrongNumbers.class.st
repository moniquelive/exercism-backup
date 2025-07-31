Class {
	#name : #ArmstrongNumbers,
	#superclass : #Object,
	#category : #'Exercise@ArmstrongNumbers'
}

{ #category : #testing }
ArmstrongNumbers >> isArmstrongNumber: number [

	^ number
	  = ((1 to: number numberOfDigits) inject: 0 into: [ :acc :each | 
			   acc
			   +
			   ((number decimalDigitAt: each) raisedTo: number numberOfDigits) ])
]
