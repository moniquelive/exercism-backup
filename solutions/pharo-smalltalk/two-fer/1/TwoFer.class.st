Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #operations }
TwoFer >> who [

	^ 'One for you, one for me.'
]

{ #category : #operations }
TwoFer >> who: aString [

	^ 'One for ' , aString , ', one for me.'
]
