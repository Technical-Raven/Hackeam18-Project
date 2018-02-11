extends Node

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
			$AcceptDialog.dialog_text="Register Successful"
			set_process(false)
		elif result=='Error':
			print("Failed")
			set_process(false)
			$AcceptDialog.dialog_text="Register Failed, Username Already exist"
		else:
			print(result)
	f.close()
func register():
	var head='http://devsilver.me/hackeampr.php?'
	head+='name='+$GridContainer2/LineEdit.text+'&'
	head+='username='+$GridContainer2/LineEdit2.text+'&'
	head+='password='+$GridContainer2/LineEdit4.text+'&'
	head+='gender='+$GridContainer2/LineEdit5.text+'&'
	head+='category='+$OptionButton.text.substr(0,1)+'&'
	head+='number='+$GridContainer2/LineEdit6.text
	$HTTPRequest.download_file='res://result'
	var f=File.new()
	if f.file_exists('res://result'):
		var d=Directory.new()
		d.remove('res://result')
		print("File Removed")
		globals.username=$GridContainer2/LineEdit2.text
		globals.register()
		#d.close()
	f.close()
	b=$HTTPRequest.request(head)
	$AcceptDialog.dialog_text="Processing.."
	$AcceptDialog.show()
	set_process(true)
func _on_Signup_pressed():
	register()
func _physics_process(delta):
	if globals.l.size()>=4:
		if globals.l[3]=='B':
			get_tree().change_scene('res://scenes/broker id.tscn')
		elif globals.l[3]=='F':
			get_tree().change_scene('res://scenes/farmerid.tscn')
			