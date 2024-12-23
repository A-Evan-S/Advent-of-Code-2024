"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAoCDay23',
	#superclass : 'PackageManifest',
	#category : 'AoCDay23-Manifest',
	#package : 'AoCDay23',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAoCDay23 class >> ruleCollectionMessagesToExternalObjectRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Day23Solver #parseRawData #false)) #'2024-12-22T22:14:27.293-08:00') )
]

{ #category : 'code-critics' }
ManifestAoCDay23 class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Day23Solver #parseRawData #false)) #'2024-12-22T22:14:39.754-08:00') )
]
