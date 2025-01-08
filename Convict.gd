extends Person
class_name Convict

var freedomDate:int

func CheckForEmancipation(date:int):
	if date >= freedomDate:
		pass
		# I'm no longer a convict!

func TimeRemaining(date) -> String:
	var secondsRemaining = freedomDate - date
	var timeDict = Time.get_date_dict_from_unix_time(secondsRemaining)

	return "Freedom in " + str(timeDict["year"]) + " year(s), " + str(timeDict["month"]) + " month(s), " + str(timeDict["day"]) + " day(s)"
