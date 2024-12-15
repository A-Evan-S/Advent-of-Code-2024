"
A Day15SolverTest is a test class for testing the behavior of Day15Solver
"
Class {
	#name : 'Day15SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay15-Tests',
	#package : 'AoCDay15-Tests'
}

{ #category : 'test data' }
Day15SolverTest >> sampleInput1 [
	^ '########
#..O.O.#
##@.O..#
#...O..#
#.#.O..#
#...O..#
#......#
########

<^^>>>vv<v>>v<<'
]

{ #category : 'test data' }
Day15SolverTest >> sampleInput2 [
	^ '##########
#..O..O.O#
#......O.#
#.OO..O.O#
#..O@..O.#
#O#..O...#
#O..O..O.#
#.OO.O.OO#
#....O...#
##########

<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^'
]

{ #category : 'test data' }
Day15SolverTest >> sampleInput3 [
	^ '#######
#...#.#
#.....#
#..OO@#
#..O..#
#.....#
#######

<vv<<^^<<^^'
]

{ #category : 'tests' }
Day15SolverTest >> testSolvePart1 [

	| solver |
	solver := Day15Solver newFromString: self sampleInput1.
	self assert: solver solvePart1 equals: 2028.
	solver := Day15Solver newFromString: self sampleInput2.
	self assert: solver solvePart1 equals: 10092.
]

{ #category : 'tests' }
Day15SolverTest >> testSolvePart2 [

	| solver |
	solver := Day15Solver newFromString: self sampleInput3.
	self assert: solver solvePart2 equals: 618.
	solver := Day15Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 9021
]
