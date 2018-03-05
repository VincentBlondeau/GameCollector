"
GameListPresenter new openWithSpec.

GameListPresenter new 
	on: GameCollector smallCollection;
	openWithSpec
"
Class {
	#name : #GameListPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'items',
		'collector',
		'listPresenter'
	],
	#category : #'GameCollector-UI'
}

{ #category : #specs }
GameListPresenter class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #listPresenter];
		yourself
]

{ #category : #scripting }
GameListPresenter class >> openOnSmallCollection [
	<script>
	GameListPresenter new
		on: GameCollector smallCollection;
		openWithSpec
]

{ #category : #specs }
GameListPresenter class >> title [
	^ 'Collector'
]

{ #category : #initialization }
GameListPresenter >> initializeWidgets [
	listPresenter := self newList.
	listPresenter sortingBlock: [ :assocA :assocB | assocA title < assocB title ].
	listPresenter displayBlock: [ :assoc | assoc title ].
	self focusOrder add: listPresenter.
]

{ #category : #initialization }
GameListPresenter >> listPresenter [
	^ listPresenter
]

{ #category : #initialization }
GameListPresenter >> on: aGameCollector [
	collector := aGameCollector.
	listPresenter items: (collector collectionNamed: #owned).

]

{ #category : #initialization }
GameListPresenter >> title [

	^ 'Games'
]

{ #category : #initialization }
GameListPresenter >> whenSelectedItemChanged: aBlock [
  	listPresenter whenSelectedItemChanged: aBlock
]
