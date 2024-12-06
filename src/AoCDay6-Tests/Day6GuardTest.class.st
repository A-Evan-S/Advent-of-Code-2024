"
A Day6GuardTest is a test class for testing the behavior of Day6Guard
"
Class {
	#name : 'Day6GuardTest',
	#superclass : 'TestCase',
	#category : 'AoCDay6-Tests',
	#package : 'AoCDay6-Tests'
}

{ #category : 'tests' }
Day6GuardTest >> testTurnRight [

	| guard |
	guard := Day6Guard new direction: 0 @ 1.
	self assert: guard direction equals: 0 @ 1.
	guard turnRight.
	self assert: guard direction equals: 1 @ 0.
	guard turnRight.
	self assert: guard direction equals: 0 @ -1.
	guard turnRight.
	self assert: guard direction equals: -1 @ 0.
	guard turnRight.
	self assert: guard direction equals: 0 @ 1
]
