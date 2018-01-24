Extension { #name : #FileReference }

{ #category : #'*GameCollector' }
FileReference >> lastNameFor: baseFileName extension: extension [
	"Assumes a file name includes a version number encoded as '.' followed by digits 
	preceding the file extension, e.g., games.22.ston
	
   Answer the file name with the largest number.
	If a version number is not found, raises an error"

	"FileSystem workingDirectory lastNameFor: 'games' extension: 'ston'"

	| files |
	files := self childrenMatching: baseFileName , '.*.' , extension.
	files ifEmpty: [ ^ self error: 'No file with number pattern' ].
	^ (files asSortedCollection: [ :a :b | a basename < b basename ]) last
]

{ #category : #'*GameCollector' }
FileReference >> nextNameFor: baseFileName extension: extension [
	"Assumes a file name includes a version number encoded as '.' followed by digits 
	preceding the file extension, e.g., games.22.ston
	
   Increment the version number (of the largest one) and answer the new file name, e.g., games23.ston
	If a version number is not found, set the version to 1 and answer a new file name"

	"FileSystem workingDirectory nextNameFor: 'games' extension: 'ston'"

	| files splits version |
	files := self childrenMatching: baseFileName , '.*.' , extension.
	files ifEmpty: [ ^ baseFileName , '.1.' , extension ].
	splits := files
		collect: [ :filename | filename basename splitOn: $. ]
		thenSelect: [ :split | (split at: 1) = baseFileName and: [ split size = 3 ] ].
	splits := splits asSortedCollection: [ :a :b | (a at: 2) < (b at: 2) ].
	version := splits isEmpty
		ifTrue: [ 1 ]
		ifFalse: [ (splits last at: 2) asNumber + 1 ].
	^ baseFileName , '.' , version asString , '.' , extension
]
