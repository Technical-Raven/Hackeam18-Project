extends Node

func _ready():
	pass

func _process(delta):
	$Data.bbcode_text='NAME - '+globals.l[0]+'\nGENDER - '+globals.l[1]+'\nPHONE NUMBER - '+globals.l[2]

func _on_newwork_pressed():
	get_tree().change_scene('res://scenes/newjob.tscn')

func _on_logout_pressed():
	get_tree().change_scene('res://scenes/register_page.tscn')
	globals.l=[]

func _on_available_pressed():
	get_tree().change_scene('res://scenes/work available.tscn')
