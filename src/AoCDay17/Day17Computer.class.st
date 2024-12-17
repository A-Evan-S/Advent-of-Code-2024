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

{ #category : 'accessing' }
Day17Computer >> b: anObject [

	b := anObject
]

{ #category : 'accessing' }
Day17Computer >> c: anObject [

	c := anObject
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
		0 . [ a := a >> combo ] .
		1 . [ b := b bitXor: literal ] .
		2 . [ b := combo % 8 ] .
		3 . [ a ~= 0 ifTrue: [ ip := literal - 1 ] ] .
		4 . [ b := b bitXor: c ] .
		5 . [ output add: combo % 8 ] .
		6 . [ b := a >> combo ] .
		7 . [ c := a >> combo ]
	}.
	(operations at: opcode) value.
	ip := ip + 2
	
]
