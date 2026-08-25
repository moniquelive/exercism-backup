"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestExerciseWordSearch,
	#superclass : #PackageManifest,
	#category : #'Exercise@WordSearch-Manifest'
}

{ #category : #'code-critics' }
ManifestExerciseWordSearch class >> ruleUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#WordSearch #searchWordsToSearchFor:grid: #false)) #'2026-08-25T17:14:55.319704-03:00') )
]
