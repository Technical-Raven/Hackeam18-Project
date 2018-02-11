extends Node

# class member variables go here, for example:
# var a = 2
var b

func _ready():
	set_process(false)

func _process(delta):
	var result=''
	var f=File.new()
	if f.file_exists('res://result'):
		f.open('res://result',1)
		result=(f.get_line())
		f.close()
		if result=="Success":
			print("Succedded")
			$AcceptDialog.dialog_text="Work Posted Successfully"
			set_process(false)
			get_tree().change_scene('res://scenes/farmerid.tscn')
		elif result=='Error':
			print("Failed")
			set_process(false)
			$AcceptDialog.dialog_text="ERROR, please check info and try again"
		else:
			print(result)
	f.close()
func register():
	var head='http://devsilver.me/hackeamfw.php?'
	head+='name='+$ScrollContainer/HSplitContainer/GridContainer2/Name.text.strip_edges()+'&'
	head+='description='+$ScrollContainer/HSplitContainer/GridContainer2/Description.text.strip_edges()+'&'
	head+='location='+$ScrollContainer/HSplitContainer/GridContainer2/Location.text.strip_edges()+'&'
	head+='wage='+str($ScrollContainer/HSplitContainer/GridContainer2/wage.text)+'&'
	head+='no='+str($ScrollContainer/HSplitContainer/GridContainer2/Contact.text)+'&'
	head+='time='+str($ScrollContainer/HSplitContainer/GridContainer2/time.text)+'&'
	head+='worker='+str($ScrollContainer/HSplitContainer/GridContainer2/workers.text)
	head+='&username='+globals.username
	$HTTPRequest.download_file='res://result'
	var f=File.new()
	if f.file_exists('res://result'):
		var d=Directory.new()
		d.remove('res://result')
		print("File Removed")
		#d.close()
	f.close()
	print(head)
	b=$HTTPRequest.request(head)
	$AcceptDialog.dialog_text="Processing.."
	$AcceptDialog.show()
	set_process(true)

func _on_post_pressed():
	register()
