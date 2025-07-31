Class {
	#name : #SumOfMultiples,
	#superclass : #Object,
	#category : #'Exercise@SumOfMultiples'
}

{ #category : #'as yet unclassified' }
SumOfMultiples >> sumFactors: factors limit: limit [

	^ ((1 to: limit - 1) select: [ :each | 
		   factors anySatisfy: [ :factor | 
			   each isDivisibleBy: factor ] ]) sumNumbers
]
