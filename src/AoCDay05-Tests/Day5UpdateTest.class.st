"
A Day5UpdateTest is a test class for testing the behavior of Day5Update
"
Class {
	#name : 'Day5UpdateTest',
	#superclass : 'TestCase',
	#category : 'AoCDay05-Tests',
	#package : 'AoCDay05-Tests'
}

{ #category : 'tests' }
Day5UpdateTest >> testMiddlePageNumber [
	self assert: ((Day5Update newFromString: '75,47,61,53,29') middlePageNumber) equals: 61.
	self assert: ((Day5Update newFromString: '75,29,13') middlePageNumber) equals: 29.
]

{ #category : 'tests' }
Day5UpdateTest >> testSatisfies [
	self assert: ((Day5Update newFromString: '1,4,3,8,5,9') satisfies: #(3 5)).
	self assert: ((Day5Update newFromString: '3,8,5,9,1,4') satisfies: #(3 5)).
	self deny: ((Day5Update newFromString: '5,3,8,9,1,4') satisfies: #(3 5)).
	self assert: ((Day5Update newFromString: '3,8,9,1,4') satisfies: #(3 5)).
]
