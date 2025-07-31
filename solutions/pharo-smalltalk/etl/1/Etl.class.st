Class {
	#name : #Etl,
	#superclass : #Object,
	#category : #'Exercise@Etl'
}

{ #category : #'as yet unclassified' }
Etl >> transformData: oldScore [

	" First Solution:
	
		^ Dictionary newFromAssociations:
		  (dict associations flatCollect: [ :each | 
			   each value collect: [ :key | 
				   Association key: key asLowercase value: each key asNumber ] ])"

	" Second solution, using `inject: into:` "
	^ oldScore associations
		  inject: Dictionary new
		  into: [ :dict :assoc | 
			  assoc value do: [ :val | 
				  dict at: val uncapitalized put: assoc key asNumber ].
			  dict ]
]
