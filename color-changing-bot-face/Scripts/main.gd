extends Control

####################################################################################################
####																							####
####										LESSON #001											####
####																							####
####	This project will teach you about the _ready function.									####
####	The _ready function exists in every type of node, even if you don't add it.				####
####																							####
####	In this project, there's a single image of the Godot Bot.								####
####	It's in grayscale right now, but you're about to change that.							####
####	I've created an initialize() function that will take care of all the initialization.	####
####	Use the _ready function to run the initialize() function to kick off the process.		####
####																							####
####										GOOD LUCK!											####
####																							####
####################################################################################################


############################################################################################
####																					####
####	This is the _ready function. Every node has this function.						####
####	If you don't add it, the function still exists; it just doesn't do anything.	####
####	It runs the first first frame the node exists in the scene.						####
####	This makes it useful for initializing nodes.									####
####																					####
############################################################################################
func _ready() -> void:
	pass





















####################################################################################
####																			####
####																			####
####						IGNORE CODE BEYOND THIS POINT						####
####																			####
####																			####
####################################################################################























var next_color: int = 0
var prev_color: int = 0
var colors = [Vector3(1.25, 0, 0), Vector3(1.25, .4, 0), Vector3(1.25, 1.25, 0), Vector3(0, 1.25, 0), Vector3(0, 1.25, 1.25), Vector3(0, 0, 1.25), Vector3(.6, 0, 1.25), Vector3(1.25, 0, 1.25)]


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and event.physical_keycode == KEY_ESCAPE:
		get_tree().quit()


func initialize():
	$InstructionLabel.text = "Nice job! Enjoy the show!"
	change_color()


func change_color():
	prev_color = next_color
	while next_color == prev_color:
		next_color = randi_range(0, len(colors) - 1)
	$BotTexture.material.set("shader_parameter/outerColor", colors[prev_color])
	$BotTexture.material.set("shader_parameter/innerColor", colors[next_color])
	$BotTexture.material.set("shader_parameter/radius", 0.0)
	var tween = create_tween()
	tween.tween_property($BotTexture.material, "shader_parameter/radius", 3.0, 2.0)
	await tween.finished
	change_color()
