Class {
	#name : 'SumOfMultiples',
	#superclass : 'Object',
	#category : 'Exercise@SumOfMultiples',
	#package : 'Exercise@SumOfMultiples'
}

{ #category : 'as yet unclassified' }
SumOfMultiples >> sumFactors: factors limit: limit [

	^ ((1 to: limit - 1) select: [ :n |
		   factors anySatisfy: [ :factor | n isDivisibleBy: factor ] ])
		  sumNumbers
]
