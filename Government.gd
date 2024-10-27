extends Resource

var convicts:Array[Person]
var soldiers:Array
var clerks:Array

var landRegistry # Need to work out how to store the land that's been granted and to whom
var taxPolicy
var cash:float = 9999

func GameDay():
	for soldier in soldiers:
		pass
		#pay solder
	for clerk in clerks:
		pass
		#pay clerk
