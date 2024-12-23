"
A Day23SolverTest is a test class for testing the behavior of Day23Solver
"
Class {
	#name : 'Day23SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay23-Tests',
	#package : 'AoCDay23-Tests'
}

{ #category : 'test data' }
Day23SolverTest >> sampleInput [

	^ 'kh-tc
qp-kh
de-cg
ka-co
yn-aq
qp-ub
cg-tb
vc-aq
tb-ka
wh-tc
yn-cg
kh-ub
ta-co
de-co
tc-td
tb-wq
wh-td
ta-ka
td-qp
aq-cg
wq-ub
ub-vc
de-ta
wq-aq
wq-vc
wh-yn
ka-de
kh-ta
co-tc
wh-qp
tb-vc
td-yn'
]

{ #category : 'tests' }
Day23SolverTest >> testSolvePart1 [

	| solver |
	solver := Day23Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 7
]

{ #category : 'tests' }
Day23SolverTest >> testSolvePart2 [

	| solver |
	solver := Day23Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 'co,de,ka,ta'
]
