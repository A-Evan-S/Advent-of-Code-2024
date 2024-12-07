"
A Day7EquationTest is a test class for testing the behavior of Day7Equation
"
Class {
	#name : 'Day7EquationTest',
	#superclass : 'TestCase',
	#category : 'AoCDay7-Tests',
	#package : 'AoCDay7-Tests'
}

{ #category : 'tests' }
Day7EquationTest >> testCanBeSolved [

	| plus mult conc |
	plus := [ :a :b | a + b ].
	mult := [ :a :b | a * b ].
	conc := [ :a :b | a || b ].
	self assert: ((Day7Equation newFromString: '190: 10 19') canBeSolved: { mult }).
	self assert: ((Day7Equation newFromString: '190: 10 19') canBeSolved: { plus . mult }).
	self assert: ((Day7Equation newFromString: '7290: 6 8 6 15') canBeSolved: { conc . mult }).
	self deny: ((Day7Equation newFromString: '190: 10 19') canBeSolved: { plus . conc }).
]
