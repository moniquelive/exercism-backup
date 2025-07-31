Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'Exercise@Die'
}

{ #category : #arithmetic }
DieHandle >> + aDieHandle [

	^ self class new
		  addDice: self dice , aDieHandle dice;
		  yourself
]

{ #category : #adding }
DieHandle >> addDice: aCollection [

	dice addAll: aCollection
]

{ #category : #adding }
DieHandle >> addDie: aDie [ 
	dice add: aDie
]

{ #category : #accessing }
DieHandle >> dice [

	^ dice
]

{ #category : #accessing }
DieHandle >> diceNumber [

	^ dice size
]

{ #category : #initialization }
DieHandle >> initialize [ 

	dice := OrderedCollection new
]

{ #category : #action }
DieHandle >> roll [
	^ (dice collect: #roll) sum
]
