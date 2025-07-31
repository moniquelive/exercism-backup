Class {
	#name : #ResistorColorDuo,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #'Exercise@ResistorColorDuo'
}

{ #category : #'as yet unclassified' }
ResistorColorDuo >> initialize [

	dict := SmallDictionary newFrom: { 
			        ('black' -> '0').
			        ('brown' -> '1').
			        ('red' -> '2').
			        ('orange' -> '3').
			        ('yellow' -> '4').
			        ('green' -> '5').
			        ('blue' -> '6').
			        ('violet' -> '7').
			        ('grey' -> '8').
			        ('white' -> '9') }
]

{ #category : #'as yet unclassified' }
ResistorColorDuo >> valueWithColors: colors [

	| colorsDigits |
	colorsDigits := (colors collect: [ :c | dict at: c ]) joinUsing: ''.
	^ colorsDigits asNumber
]
