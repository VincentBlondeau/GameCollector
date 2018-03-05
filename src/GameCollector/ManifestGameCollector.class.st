"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGameCollector,
	#superclass : #PackageManifest,
	#category : #'GameCollector-Core'
}

{ #category : #'code-critics' }
ManifestGameCollector class >> ruleRBMissingTranslationsInMenusRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#GameCollector)) #'2017-08-18T20:43:06.824575+02:00') )
]
