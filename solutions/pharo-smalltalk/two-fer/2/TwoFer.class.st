Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #operations }
TwoFer >> who [

	^ self who: 'you'
]

{ #category : #operations }
TwoFer >> who: aString [

	^ 'One for ' , aString , ', one for me.'
]
