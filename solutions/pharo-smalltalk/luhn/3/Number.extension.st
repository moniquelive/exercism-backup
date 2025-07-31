Extension { #name : #Number }

{ #category : '*Exercise@Luhn' }
Number >> isDivisibleBy: aNumber [

	(aNumber isNumber and: [ aNumber isZero not ]) ifFalse: [ ^ false ].
	^ (self \\ aNumber) isZero
]
