"
A Day24SolverTest is a test class for testing the behavior of Day24Solver
"
Class {
	#name : 'Day24SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay24-Tests',
	#package : 'AoCDay24-Tests'
}

{ #category : 'test data' }
Day24SolverTest >> sampleInput1 [ 
	^ 'x00: 1
x01: 1
x02: 1
y00: 0
y01: 1
y02: 0

x00 AND y00 -> z00
x01 XOR y01 -> z01
x02 OR y02 -> z02'
]

{ #category : 'test data' }
Day24SolverTest >> sampleInput2 [
	^ 'x00: 1
x01: 0
x02: 1
x03: 1
x04: 0
y00: 1
y01: 1
y02: 1
y03: 1
y04: 1

ntg XOR fgs -> mjb
y02 OR x01 -> tnw
kwq OR kpj -> z05
x00 OR x03 -> fst
tgd XOR rvg -> z01
vdt OR tnw -> bfw
bfw AND frj -> z10
ffh OR nrd -> bqk
y00 AND y03 -> djm
y03 OR y00 -> psh
bqk OR frj -> z08
tnw OR fst -> frj
gnj AND tgd -> z11
bfw XOR mjb -> z00
x03 OR x00 -> vdt
gnj AND wpb -> z02
x04 AND y00 -> kjc
djm OR pbm -> qhw
nrd AND vdt -> hwm
kjc AND fst -> rvg
y04 OR y02 -> fgs
y01 AND x02 -> pbm
ntg OR kjc -> kwq
psh XOR fgs -> tgd
qhw XOR tgd -> z09
pbm OR djm -> kpj
x03 XOR y03 -> ffh
x00 XOR y04 -> ntg
bfw OR bqk -> z06
nrd XOR fgs -> wpb
frj XOR qhw -> z04
bqk OR frj -> z07
y03 OR x01 -> nrd
hwm AND bqk -> z03
tgd XOR rvg -> z12
tnw OR pbm -> gnj'
]

{ #category : 'test data' }
Day24SolverTest >> sampleInput3 [
	^ 'x00: 0
x01: 1
x02: 0
x03: 1
x04: 0
x05: 1
y00: 0
y01: 0
y02: 1
y03: 1
y04: 0
y05: 1

x00 AND y00 -> z05
x01 AND y01 -> z02
x02 AND y02 -> z01
x03 AND y03 -> z03
x04 AND y04 -> z04
x05 AND y05 -> z00'
]

{ #category : 'tests' }
Day24SolverTest >> testSolvePart1 [

	| solver |
	solver := Day24Solver newFromString: self sampleInput1.
	self assert: solver solvePart1 equals: 4.
	solver := Day24Solver newFromString: self sampleInput2.
	self assert: solver solvePart1 equals: 2024.
]

{ #category : 'tests' }
Day24SolverTest >> testSolvePart2 [

	| solver |
	solver := Day24Solver newFromString: self sampleInput3.
	solver intendedOperation: #bitAnd:.
	self assert: solver solvePart2 equals: 'z00,z01,z02,z05'
]
