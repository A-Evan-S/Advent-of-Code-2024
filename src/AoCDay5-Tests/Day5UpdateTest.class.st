"
A Day5UpdateTest is a test class for testing the behavior of Day5Update
"
Class {
	#name : 'Day5UpdateTest',
	#superclass : 'TestCase',
	#category : 'AoCDay5-Tests',
	#package : 'AoCDay5-Tests'
}

{ #category : 'tests' }
Day5UpdateTest >> testMiddlePageNumber [
	self assert: ((Day5Update newFromString: '75,47,61,53,29') middlePageNumber) equals: 61.
	self assert: ((Day5Update newFromString: '75,29,13') middlePageNumber) equals: 29.
]

{ #category : 'tests' }
Day5UpdateTest >> testSatisfies [
	| rule update |
	rule := Day5Rule newFromString: '3|5'.
	update := Day5Update newFromString: '1,4,3,8,5,9'.
	self assert: (update satisfies: rule)
]
