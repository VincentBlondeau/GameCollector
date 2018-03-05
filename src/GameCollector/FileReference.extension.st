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
