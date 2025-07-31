Class {
	#name : #SpaceAge,
	#superclass : #Object,
	#category : #'Exercise@SpaceAge'
}

{ #category : #query }
SpaceAge >> ageOnPlanet: planet at: seconds [

	^ (self class environment at: planet asSymbol) new
		  seconds: seconds;
		  ageInEarthYears
]
