Class {
	#name : 'Etl',
	#superclass : 'Object',
	#category : 'Exercise@Etl',
	#package : 'Exercise@Etl'
}

{ #category : 'as yet unclassified' }
Etl >> transformData: oldScore [
	" First Solution:
		^ Dictionary newFromAssociations:
		  (dict associations flatCollect: [ :each | 
			   each value collect: [ :key | 
				   Association key: key asLowercase value: each key asNumber ] ])"

	" Second solution, using `inject: into:` 
	^ oldScore associations
		  inject: Dictionary new
		  into: [ :dict :assoc |
			  assoc value do: [ :val |
				  dict at: val asLowercase put: assoc key asNumber ].
			  dict ]"

	" Third solution, using `flatCollect:` "

	^ (oldScore associations flatCollect: [ :assoc |
		   assoc value collect: [ :val |
			   val asLowercase -> assoc key asNumber ] ]) asDictionary
]
