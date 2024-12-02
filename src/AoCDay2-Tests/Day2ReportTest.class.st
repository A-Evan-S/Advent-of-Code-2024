"
A Day2ReportTest is a test class for testing the behavior of Day2Report
"
Class {
	#name : 'Day2ReportTest',
	#superclass : 'TestCase',
	#category : 'AoCDay2-Tests',
	#package : 'AoCDay2-Tests'
}

{ #category : 'tests' }
Day2ReportTest >> testIsDecreasing [
	self assert: (Day2Report newFromString: '7 6 4 2 1') isDecreasing.
	self assert: (Day2Report newFromString: '1 2 7 8 9') isDecreasing not.
	self assert: (Day2Report newFromString: '8 6 4 4 1') isDecreasing not.
]

{ #category : 'tests' }
Day2ReportTest >> testIsIncreasing [
	self assert: (Day2Report newFromString: '1 2 7 8 9') isIncreasing.
	self assert: (Day2Report newFromString: '9 7 6 2 1') isIncreasing not.
	self assert: (Day2Report newFromString: '1 1 1 1 1') isIncreasing not.
]

{ #category : 'tests' }
Day2ReportTest >> testIsNearlySafe [
	self assert: (Day2Report newFromString: '7 6 4 2 1') isNearlySafe.
	self assert: (Day2Report newFromString: '1 3 2 4 5') isNearlySafe.
	self assert: (Day2Report newFromString: '1 2 7 8 9') isNearlySafe not.
	self assert: (Day2Report newFromString: '1 3 2 4 5') isNearlySafe.
]

{ #category : 'tests' }
Day2ReportTest >> testIsSafe [
	self assert: (Day2Report newFromString: '7 6 4 2 1') isSafe.
	self assert: (Day2Report newFromString: '1 2 7 8 9') isSafe not.
	self assert: (Day2Report newFromString: '1 3 2 4 5') isSafe not.
]

{ #category : 'tests' }
Day2ReportTest >> testLevelsAreSimilar [
	self assert: (Day2Report newFromString: '7 6 4 2 1') levelsAreSimilar.
	self assert: (Day2Report newFromString: '9 7 6 2 1') levelsAreSimilar not.
	self assert: (Day2Report newFromString: '8 6 4 4 1') levelsAreSimilar not.
]
