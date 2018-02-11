extends Node

# class member variables go here, for example:
# var a = 2
var b
var l=[]

func _ready():
	var c=HTTPRequest.new()
	add_child(c)
	c.name='HTTPRequest'
	set_process(false)
	register()
func _process(delta):
	var result=''
	var f=File.new()
	if f.file_exists('res://result'):
		f.open('res://result',1)
		result=(f.get_line())
		f.close()
		if result!="Error" and result.length()>2:
			print(result)
			print(l)
			set_process(false)
		elif result=='Error':
			print("Failed")
			set_process(false)
		else:
			print(result)
	f.close()
func register():
	var head='http://devsilver.me/hackeamgeneral.php?query=SELECT+*+FROM+Farmwork'
	#var head='http://devsilver.me/hackeamgeneral.phhp?quer'
	print('retriving data')
	$HTTPRequest.download_file='res://result'
	var f=File.new()
	if f.file_exists('res://result'):
		var d=Directory.new()
		d.remove('res://result')
		print("File Removed")
		#d.close()
	f.close()
	b=$HTTPRequest.request(head)

func _on_Button2_pressed():
	get_tree().change_scene('res://scenes/broker id.tscn')


func _on_Button_pressed():
	get_tree().change_scene('res://scenes/register_page.tscn')
	globals.l=[]
