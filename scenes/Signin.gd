extends Sprite

var b
func _ready():
	pass
	
func _process(delta):
	var result=''
	var f=File.new()
	if f.file_exists('res://result'):
		f.open('res://result',1)
		result=(f.get_line())
		f.close()
		if result==$username/pass.text:
			print("Succedded")
			$AcceptDialog.dialog_text="Login Successful"
			set_process(false)
			globals.username=$username.text
			globals.register()
		elif result!='':
			print("Failed")
			set_process(false)
			$AcceptDialog.dialog_text="Login Failed"
	f.close()
func _physics_process(delta):
	if globals.l.size()>=4:
		if globals.l[3]=='B':
			get_tree().change_scene('res://scenes/broker id.tscn')
		elif globals.l[3]=='F':
			get_tree().change_scene('res://scenes/farmerid.tscn')
func signin():
	var head="http://devsilver.me/hackeamlogin.php?username="+$username.text
	
	$HTTPRequest.download_file='res://result'
	var f=File.new()
	if f.file_exists('res://result'):
		var d=Directory.new()
		d.remove('res://result')
		print("File Removed")
		#d.close()
	f.close()
	b=$HTTPRequest.request(head)
	$AcceptDialog.dialog_text="Processing.."
	$AcceptDialog.show()
	set_process(true)

func _on_signin_pressed():
	signin()