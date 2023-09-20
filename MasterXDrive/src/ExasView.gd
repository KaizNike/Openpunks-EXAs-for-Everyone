extends Node2D

const cell_len = 10
const offset = Vector2(2,2)
onready var lines := $Lines

export (PackedScene) var exa

# basic layout to test
const mXD = {"loc": Vector2(12, 3), "data": [{"packageType": "EXA", "contents": "NOTE: EDIT ME\n", "loc": Vector2(0,0)}]}

# Standard Element Dictionary Layout
const element = {"packageType": "None", "contents": "None", "loc": Vector2.ZERO}

func _ready():
	for x in range(mXD.loc.x+1):
		var line = Line2D.new()
		line.width = 1
		for y in range(mXD.loc.y+1):
			var loc = Vector2(
				x * cell_len,
				y * cell_len
			)
			loc += offset
			line.add_point(loc)
		lines.add_child(line)
	for y in range(mXD.loc.y+1):
		var line = Line2D.new()
		line.width = 1
		for x in range(mXD.loc.x+1):
			var loc = Vector2(x * cell_len,y * cell_len)
			loc += offset
			line.add_point(loc)
		lines.add_child(line)
	yield(get_tree(),"idle_frame")
	read_data(mXD.data)
	print("DONE")


func read_data(data:Array):
	for item in data:
		if item.packageType == "EXA":
			Globals.exaScripts += item.contents
			var newExa = exa.instance()
			newExa.position = offset + Vector2(item.loc.x * cell_len + cell_len / 2, item.loc.y * cell_len + cell_len / 2)
			$DataTypes.add_child(newExa)
		pass
