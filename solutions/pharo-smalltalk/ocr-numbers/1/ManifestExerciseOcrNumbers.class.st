"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestExerciseOcrNumbers',
	#superclass : 'PackageManifest',
	#category : 'Exercise@OcrNumbers-Manifest',
	#package : 'Exercise@OcrNumbers',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestExerciseOcrNumbers class >> ruleUnclassifiedMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#OcrNumbers #convertRows: #false)) #'2026-08-26T18:07:17.997828-03:00') )
]
