"
GameItemDisplayer new 
	gameItem: GameItem finalFantasyX; 
	openWithSpec
	
NewGameItemDisplayer new 
	openWithSpec
"
Class {
	#name : #GameItemPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'gameItem',
		'consoleDropListModel',
		'hasDocCheckBoxModel',
		'hasBoxCheckBoxModel',
		'finishedCheckBoxModel',
		'conditionDropListModel',
		'commentsTextModel',
		'titleNameTextModel',
		'criticsTextModel',
		'quotationTextModel',
		'imagePresenter'
	],
	#category : #'GameCollector-UI'
}

{ #category : #specs }
GameItemPresenter class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :col | 
			col add: #titleNameTextModel height: self inputTextHeight.
			col
				newRow: [ :row | 
					row add: #consoleDropListModel.
					row add: #criticsTextModel.
					row add: #quotationTextModel.
					row add: #conditionDropListModel ]
				height: self inputTextHeight.
			col
				newRow: [ :row | 
					row add: #hasDocCheckBoxModel.
					row add: #finishedCheckBoxModel.
					row add: #hasBoxCheckBoxModel ]
				height: self inputTextHeight.
			col add: #commentsTextModel height: self inputTextHeight * 4.
			col newRow: [ :row | row add: #imagePresenter ] height: 300.
			col newRow: [ :row |  ] ];
		yourself
]

{ #category : #specs }
GameItemPresenter class >> inputCharWidth [
	^ 16
]

{ #category : #scripting }
GameItemPresenter class >> openOnFFX [
	<script>
	GameItemPresenter new
		gameItem: GameItem finalFantasyX;
		openWithSpec
]

{ #category : #'widget accessing' }
GameItemPresenter >> commentsTextModel [

	^ commentsTextModel 
]

{ #category : #'widget accessing' }
GameItemPresenter >> conditionDropListModel [ 

	^ conditionDropListModel 
]

{ #category : #'widget accessing' }
GameItemPresenter >> consoleDropListModel [ 
	^ consoleDropListModel 
]

{ #category : #'widget accessing' }
GameItemPresenter >> criticsTextModel [

	^ criticsTextModel 
]

{ #category : #api }
GameItemPresenter >> extent [
	^ 280 @ 450
]

{ #category : #'widget accessing' }
GameItemPresenter >> finishedCheckBoxModel [ 

	^ finishedCheckBoxModel 
]

{ #category : #'domain object' }
GameItemPresenter >> gameItem: aNewGameItem [

	gameItem value: aNewGameItem
]

{ #category : #initialization }
GameItemPresenter >> gameItemChanged [
	titleNameTextModel text: gameItem value title.
	consoleDropListModel setSelectedItem: gameItem value console.
	conditionDropListModel setSelectedItem: gameItem value condition.
	hasDocCheckBoxModel state: gameItem value hasDocumentation.
	finishedCheckBoxModel state: gameItem value finished.
	quotationTextModel text: gameItem value quotation.
	commentsTextModel text: gameItem value comments.
	criticsTextModel text: gameItem value critics.
	imagePresenter image: gameItem value fetchCoverForm
]

{ #category : #'widget accessing' }
GameItemPresenter >> hasBoxCheckBoxModel [ 

	^ hasBoxCheckBoxModel 
]

{ #category : #'widget accessing' }
GameItemPresenter >> hasDocCheckBoxModel [ 
	^ hasDocCheckBoxModel
	
	
]

{ #category : #accessing }
GameItemPresenter >> imagePresenter [
	^ imagePresenter
]

{ #category : #initialization }
GameItemPresenter >> initialize [
	"All the element with be based on the gameItem"

	gameItem := nil asValueHolder.
	"order important since initialize will invoke initialiseWidgets and initializePresenter. In the future we should have initializeSubject: "
	super initialize.

]

{ #category : #initialization }
GameItemPresenter >> initializePresenter [

	gameItem
		whenChangedDo: [ self gameItemChanged ]
]

{ #category : #initialization }
GameItemPresenter >> initializeWidgets [
	titleNameTextModel := self newTextInput.
	titleNameTextModel ghostText: 'Name of game'.
	self setConsoleDropList.
	self setHasDocCheckBox.
	self setHasBoxCheckBox.
	self setFinishCheckBox.
	self setConditionDropList.
	quotationTextModel := self newTextInput.
	quotationTextModel ghostText: 'in Euros'.
	criticsTextModel := self newTextInput.
	criticsTextModel ghostText: ' x / 20 '.
	commentsTextModel := self newTextInput.
	criticsTextModel ghostText: ' May be you want to add something... '.
	imagePresenter := self newImage
]

{ #category : #'domain object' }
GameItemPresenter >> on: aNewGameItem [

	gameItem value: aNewGameItem
]

{ #category : #'widget accessing' }
GameItemPresenter >> quotationTextModel [ 
	^ quotationTextModel 
]

{ #category : #initialization }
GameItemPresenter >> setConditionDropList [
	conditionDropListModel := self newDropList.
	conditionDropListModel items: GameItem conditions.
	conditionDropListModel displayBlock: [ :m | m asString ]
]

{ #category : #initialization }
GameItemPresenter >> setConsoleDropList [
	consoleDropListModel := self newDropList.
	consoleDropListModel items: GameItem consoles.
	consoleDropListModel displayBlock: [ :m | m ]
]

{ #category : #initialization }
GameItemPresenter >> setFinishCheckBox [
	finishedCheckBoxModel := self newCheckBox.
	finishedCheckBoxModel label: 'Finished'
]

{ #category : #initialization }
GameItemPresenter >> setHasBoxCheckBox [
	hasBoxCheckBoxModel := self newCheckBox.
	hasBoxCheckBoxModel label: 'Box'
]

{ #category : #initialization }
GameItemPresenter >> setHasDocCheckBox [
	hasDocCheckBoxModel := self newCheckBox.
	hasDocCheckBoxModel label: 'Doc'
]

{ #category : #spec }
GameItemPresenter >> title [

	^ 'Game'
]

{ #category : #'widget accessing' }
GameItemPresenter >> titleNameTextModel [
	^ titleNameTextModel
]
