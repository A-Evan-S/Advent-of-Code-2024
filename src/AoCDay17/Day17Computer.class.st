"
I am an 8-bit computer with 3 registers
"
Class {
	#name : 'Day17Computer',
	#superclass : 'Object',
	#instVars : [
		'a',
		'b',
		'c',
		'program',
		'ip',
		'halted',
		'output'
	],
	#category : 'AoCDay17',
	#package : 'AoCDay17'
}

{ #category : 'accessing' }
Day17Computer >> a: anObject [

	a := anObject
]

{ #category : 'performing' }
Day17Computer >> adv: combo [

	a := a // (2 ** combo).
	ip := ip + 2
]

{ #category : 'accessing' }
Day17Computer >> b: anObject [

	b := anObject
]

{ #category : 'performing' }
Day17Computer >> bdv: combo [
	
	b := a // (2 ** combo).
	ip := ip + 2
]

{ #category : 'performing' }
Day17Computer >> bst: combo [

	b := combo % 8.
	ip := ip + 2
]

{ #category : 'performing' }
Day17Computer >> bxc [

	b := b bitXor: c.
	ip := ip + 2
]

{ #category : 'performing' }
Day17Computer >> bxl: literal [

	b := b bitXor: literal.
	ip := ip + 2
]

{ #category : 'accessing' }
Day17Computer >> c: anObject [

	c := anObject
]

{ #category : 'performing' }
Day17Computer >> cdv: combo [
	
	c := a // (2 ** combo).
	ip := ip + 2
]

{ #category : 'accessing' }
Day17Computer >> halted [

	^ halted
]

{ #category : 'initialization' }
Day17Computer >> initialize [

	ip := 1.
	halted := false.
	output := OrderedCollection new.
]

{ #category : 'performing' }
Day17Computer >> jnz: literal [

	ip := a = 0
		      ifTrue: [ ip + 2 ]
		      ifFalse: [ literal + 1 ]
]

{ #category : 'performing' }
Day17Computer >> out: combo [

	output add: combo % 8.
	ip := ip + 2.
]

{ #category : 'accessing' }
Day17Computer >> output [

	^ output
]

{ #category : 'accessing' }
Day17Computer >> program: anObject [

	program := anObject
]

{ #category : 'stepping' }
Day17Computer >> step [
	
	| opcode operations combo literal |
	(ip between: 1 and: program size) ifFalse: [ halted := true. ^ self ].
	opcode := program at: ip.
	literal := program at: (ip + 1).
	combo := { 0 . 1 . 2 . 3 . a . b . c } at: ((program at: (ip + 1)) + 1).
	operations := Dictionary newFromPairs: {
		0 . [ self adv: combo ] .
		1 . [ self bxl: literal ] .
		2 . [ self bst: combo ] .
		3 . [ self jnz: literal ] .
		4 . [ self bxc ] .
		5 . [ self out: combo ] .
		6 . [ self bdv: combo ] .
		7 . [ self cdv: combo ]
	}.
	(operations at: opcode) value
	
]
