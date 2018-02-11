extends Node

var username='default'
var b
var l=[]

func _ready():
	var c=HTTPRequest.new()
	add_child(c)
	c.name='HTTPRequest'
	set_process(false)
func _process(delta):
	var result=''
	var f=File.new()
	if f.file_exists('res://result'):
		f.open('res://result',1)
		result=(f.get_line())
		f.close()
		if result!="Error" and result.length()>2:
			print(result)
			l=result.substr(0,result.length()-1).split(';')
			print(l)
			set_process(false)
		elif result=='Error':
			print("Failed")
			set_process(false)
		else:
			print(result)
	f.close()
func register():
	var head='http://devsilver.me/hackeamgeneral.php?query=SELECT+name,gender,number,category+FROM+users+where+username+="'+username+'"'
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
	set_process(true)