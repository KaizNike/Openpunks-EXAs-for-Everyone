extends Node2D

const cell_len = 10
const offset = Vector2(2,2)
onready var lines := $Lines

# basic layout to test
const mXD = [6, 6, {"packageType": "EXA", "contents": "NOTE: EDIT ME\n", "loc": Vector2(0,0)}]

# Standard Element Dictionary Layout
const element = {"packageType": "None", "contents": "None", "loc": Vector2.ZERO}

func _ready():
	for x in range(mXD[0]):
		var line = Line2D.new()
		line.width = 1
		for y in range(mXD[1]):
			var loc = Vector2(
				x * cell_len,
				y * cell_len
			)
			loc += offset
			line.add_point(loc)
		lines.add_child(line)
	for y in range(mXD[1]):
		var line = Line2D.new()
		line.width = 1
		for x in range(mXD[0]):
			var loc = Vector2(x * cell_len,y * cell_len)
			loc += offset
			line.add_point(loc)
		lines.add_child(line)
	print("DONE")
