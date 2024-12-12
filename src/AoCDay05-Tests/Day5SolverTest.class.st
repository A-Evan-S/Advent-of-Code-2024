"
A Day5SolverTest is a test class for testing the behavior of Day5Solver
"
Class {
	#name : 'Day5SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay05-Tests',
	#package : 'AoCDay05-Tests'
}

{ #category : 'test data' }
Day5SolverTest >> sampleInput [
	^ '47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13<n><n>75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47' expandMacros
]

{ #category : 'tests' }
Day5SolverTest >> testSolvePart1 [

	| solver |
	solver := Day5Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 143
]

{ #category : 'tests' }
Day5SolverTest >> testSolvePart2 [

	| solver |
	solver := Day5Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 123
]
