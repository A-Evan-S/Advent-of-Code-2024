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

	self assert: ((Day7Equation newFromString: '190: 10 19') canBeSolved: { #* }).
	self assert: ((Day7Equation newFromString: '190: 10 19') canBeSolved: { #+ . #* }).
	self assert: ((Day7Equation newFromString: '7290: 6 8 6 15') canBeSolved: { #|| . #* }).
	self deny: ((Day7Equation newFromString: '190: 10 19') canBeSolved: { #+ . #|| }).
]
