"
A directional keypad of the format:

```
    +---+---+
    | ^ | A |
+---+---+---+
| < | v | > |
+---+---+---+
```
"
Class {
	#name : 'Day21DirectionalKeypad',
	#superclass : 'Day21Keypad',
	#category : 'AoCDay21',
	#package : 'AoCDay21'
}

{ #category : 'initialization' }
Day21DirectionalKeypad >> initialize [

	super initialize.
	keyPositions := Dictionary newFromPairs: {
		$A . 1 @ 3 .
		$^ . 1 @ 2 .
		$v . 2 @ 2 .
		$> . 2 @ 3 .
		$< . 2 @ 1
	}.
	disallowedSpace := 1 @ 1.
]
