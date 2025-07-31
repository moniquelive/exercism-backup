Class {
	#name : #ArmstrongNumbers,
	#superclass : #Object,
	#category : #'Exercise@ArmstrongNumbers'
}

{ #category : #testing }
ArmstrongNumbers >> isArmstrongNumber: number [

	^ number = (number asString inject: 0 into: [ :acc :each | 
		   acc + (each digitValue raisedTo: number numberOfDigits) ])
]
