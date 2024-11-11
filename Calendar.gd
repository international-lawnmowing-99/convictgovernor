class_name Calendar
extends Resource

var unixDate = 0

func GameDay():
	unixDate += 62400
	#print(str(Time.get_datetime_dict_from_unix_time(unixDate)))
