extends Node

@export var score_label:Node
@export var instructions_label:Node
@export var date_picture:Node

var score = 0
var timer = 0

var willDateEverArrive = false
var whenWillDateArrive = 0

#TODO:
#-Change music
#-Change random range
#-Test on mobile
#-Change font size
#-Add messages?

# Called when the node enters the scene tree for the first time.
func _ready():
	if(randi_range(0,1) == 1):
		willDateEverArrive = true
		whenWillDateArrive = randi_range(30, 300)
	
	print(str(willDateEverArrive, whenWillDateArrive))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if(Input.is_action_pressed("ui_select")):
		timer += delta
		if (timer >= 1):
			timer = 0
			score += 1
		score_label.text = str("You've been waiting ", score, " seconds for your date.")
		
		if(score >= 1):
			instructions_label.visible = false
		
		if(score >= whenWillDateArrive && willDateEverArrive):
			score_label.text = str("Your date is here! Yay!")
			date_picture.visible = true
			set_process(false)
		
	elif(Input.is_action_just_released("ui_select")):
		set_process(false)
		print("Game Over")
		score_label.text = str("You ditched your date.")
