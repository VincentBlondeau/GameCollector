"
GameCollectorPresenter new 
	on: GameCollector smallCollection2;
	openWithSpec
	

- should add 
-- drop box (with the list of collections).
-- edit
-- save button.
"
Class {
	#name : #GameCollectorPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'gameCollector',
		'listPresenter',
		'gameItemPresenter'
	],
	#category : #'GameCollector-UI'
}

{ #category : #specs }
GameCollectorPresenter class >> defaultSpec [
	^ SpecColumnLayout composed
		newRow: [ :row | 
			row
				add: #listPresenter;
				add: #gameItem;
				yourself ]; yourself
]

{ #category : #scripting }
GameCollectorPresenter class >> openAppSettingsOn: aBuilder [
	<deploymentsettings>
	(aBuilder deployment: #gameCollectorApp)
		label: 'Game Collector App';
		description: 'My super cool app to deploy!';
		actionTarget: [ GameCollectorPresenter ];
		actionTargetSelector: #openInWorldOnSmallCollection2;
		order: 100;
		parent: #UserOperations
]

{ #category : #scripting }
GameCollectorPresenter class >> openInWorldOnSmallCollection2 [
	<script>
	GameCollectorPresenter new
		on: GameCollector smallCollection2;
		openWorldWithSpec
]

{ #category : #scripting }
GameCollectorPresenter class >> openOnSmallCollection2 [
	<script>
	GameCollectorPresenter new
		on: GameCollector smallCollection2;
		openWithSpec
]

{ #category : #'spec hooks' }
GameCollectorPresenter >> extent [ 

	^ 540 @ 600
]

{ #category : #accessing }
GameCollectorPresenter >> gameItem [
	^ gameItemPresenter value
]

{ #category : #accessing }
GameCollectorPresenter >> gameItem: anObject [
	gameItemPresenter := anObject
]

{ #category : #accessing }
GameCollectorPresenter >> gameItemPresenter [
	^ gameItemPresenter
]

{ #category : #accessing }
GameCollectorPresenter >> gameItemPresenter: anObject [
	gameItemPresenter := anObject
]

{ #category : #initialization }
GameCollectorPresenter >> initializePresenter [
	listPresenter listPresenter whenSelectedItemChanged: [ :item | 
		 item ifNotNil: [gameItemPresenter gameItem: item ]]
]

{ #category : #initialization }
GameCollectorPresenter >> initializeWidgets [
	listPresenter := self instantiate: GameListPresenter.
	gameItemPresenter := self instantiate: GameItemPresenter.
	self focusOrder add: listPresenter ; add: gameItemPresenter 
]

{ #category : #accessing }
GameCollectorPresenter >> listPresenter [
	^ listPresenter
]

{ #category : #accessing }
GameCollectorPresenter >> listPresenter: anObject [
	listPresenter := anObject
]

{ #category : #accessing }
GameCollectorPresenter >> on: aGameCollector [
	gameCollector := aGameCollector.
	listPresenter on: aGameCollector.
]

{ #category : #'spec hooks' }
GameCollectorPresenter >> title [ 
	^ 'Game Collector'
]
