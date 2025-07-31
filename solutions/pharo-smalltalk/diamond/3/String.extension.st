Extension { #name : #String }

{ #category : '*Exercise@Diamond' }
String class >> space: aNumber [
	"Answer a string of aNumber spaces."

	^ self new: aNumber withAll: Character space
]
