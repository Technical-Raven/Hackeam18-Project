extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func register():
	var head='http://devsilver.me/hackeampr.php?'
	head+='name='+$GridContainer2/LineEdit.text+'&'
	head+='username='+$GridContainer2/LineEdit2.text+'&'
	head+='password='+$GridContainer2/LineEdit4.text+'&'
	head+='gender='+$GridContainer2/LineEdit5.text+'&'
	head+='category='+$OptionButton.text.substr(0,1)+'&'
	head+='number='+$GridContainer2/LineEdit6.text
	$HTTPRequest.request(head)

func _on_Signup_pressed():
	register()
