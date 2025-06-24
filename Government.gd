extends Resource
class_name Government

var convicts:Array[Convict]
var soldiers:Array
var clerks:Array

var landRegistry # Need to work out how to store the land that's been granted and to whom
var taxPolicy
var cash:float = 9999
var food = 15000

func GameDay():
	for convict in convicts:
		food -= 1
	for soldier in soldiers:
		pass
		#pay solder
	for clerk in clerks:
		pass
		#pay clerk
