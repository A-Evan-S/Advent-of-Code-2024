"
A numeric keypad of the format:

```
+---+---+---+
| 7 | 8 | 9 |
+---+---+---+
| 4 | 5 | 6 |
+---+---+---+
| 1 | 2 | 3 |
+---+---+---+
    | 0 | A |
    +---+---+
```
"
Class {
	#name : 'Day21NumericKeypad',
	#superclass : 'Day21Keypad',
	#category : 'AoCDay21',
	#package : 'AoCDay21'
}

{ #category : 'initialization' }
Day21NumericKeypad >> initialize [

	super initialize.
	keyPositions := Dictionary newFromPairs: {
		$0 . 4 @ 2 .
		$A . 4 @ 3 .
		$1 . 3 @ 1 .
		$2 . 3 @ 2 .
		$3 . 3 @ 3 .
		$4 . 2 @ 1 .
		$5 . 2 @ 2 .
		$6 . 2 @ 3 .
		$7 . 1 @ 1 .
		$8 . 1 @ 2 .
		$9 . 1 @ 3 .
	}.
	disallowedSpace := 4 @ 1.
]
