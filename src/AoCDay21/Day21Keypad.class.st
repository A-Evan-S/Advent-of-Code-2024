"
I am a generic keypad with methods for finding paths and pathlengths.
"
Class {
	#name : 'Day21Keypad',
	#superclass : 'Object',
	#instVars : [
		'cache',
		'disallowedSpace',
		'keyPositions'
	],
	#category : 'AoCDay21',
	#package : 'AoCDay21'
}

{ #category : 'solving' }
Day21Keypad >> costFrom: key1 to: key2 withLayers: layers [

   | paths costs |
   ^ cache at: ('' join: { key1. key2. layers }) ifAbsentPut: [
        layers = 0 ifTrue: [ ^ 1 ].
        paths := self pathsFrom: key1 to: key2.
        costs := paths collect: [ :path | self fullPathCost: path withLayers: layers - 1 ].
        costs min ]
]

{ #category : 'accessing' }
Day21Keypad >> directions [

   ^ Dictionary newFromPairs: {
           $^ . (-1 @ 0).
           $v . (1 @ 0).
           $> . (0 @ 1).
           $< .  (0 @ -1) }
]

{ #category : 'solving' }
Day21Keypad >> fullPathCost: path withLayers: layers [

   ^ (('A' , path) asOrderedCollection overlappingPairsCollect: [
         :key1
         :key2 | self costFrom: key1 to: key2 withLayers: layers ])
        sum
]

{ #category : 'solving' }
Day21Keypad >> fullPathOptions: code [

   | buttonOptions paths |
   buttonOptions := Set new.
   buttonOptions add: ''.
   'A' , code overlappingPairsDo: [ :key1 :key2 |
      paths := self pathsFrom: key1 to: key2.
      buttonOptions := buttonOptions flatCollect: [ :prevPath | paths collect: [ :path | prevPath , path ] ] ].
   ^ buttonOptions asOrderedCollection
]

{ #category : 'initialization' }
Day21Keypad >> initialize [

	cache := Dictionary new.
]

{ #category : 'accessing' }
Day21Keypad >> isSafePath: path startingAt: aPoint [

   | curr |
   curr := aPoint.
   ^ path noneSatisfy: [ :x |
        curr := curr + (self directions at: x).
        curr = disallowedSpace ]
]

{ #category : 'solving' }
Day21Keypad >> pathsFrom: key1 to: key2 [

   | pos1 pos2 steps |
   key1 = key2 ifTrue: [ ^ #( 'A' ) ].
   pos1 := keyPositions at: key1.
   pos2 := keyPositions at: key2.

   steps := '' join: {
        ('v' repeat: (0 max: pos2 x - pos1 x)).
        ('^' repeat: (0 max: pos1 x - pos2 x)).
        ('>' repeat: (0 max: pos2 y - pos1 y)).
        ('<' repeat: (0 max: pos1 y - pos2 y)) }.

   ^ steps permutationSet
        select: [ :path | self isSafePath: path startingAt: pos1 ]
        thenCollect: [ :path | path , 'A' ]
]
