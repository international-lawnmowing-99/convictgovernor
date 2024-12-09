class_name Calendar
extends Resource

var unixDate = 0

func GameDay():
	unixDate += 62400

func GetTimeString() -> String:
	return GetTimeStringFromUnixTime(unixDate)

func GetTimeStringFromUnixTime(time:int) -> String:
	var timeDict = Time.get_date_dict_from_unix_time(time)
	var weekdayString:String = ""

	match timeDict["weekday"]:
		Time.WEEKDAY_SUNDAY:
			weekdayString = "Sunday"
		Time.WEEKDAY_MONDAY:
			weekdayString = "Monday"
		Time.WEEKDAY_TUESDAY:
			weekdayString = "Tuesday"
		Time.WEEKDAY_WEDNESDAY:
			weekdayString = "Wednesday"
		Time.WEEKDAY_THURSDAY:
			weekdayString = "Thursday"
		Time.WEEKDAY_FRIDAY:
			weekdayString = "Friday"
		Time.WEEKDAY_SATURDAY:
			weekdayString = "Saturday"

	var monthString:String = ""

	match timeDict["month"]:
		Time.MONTH_JANUARY:
			monthString = "January"
		Time.MONTH_FEBRUARY:
			monthString = "Feburary"
		Time.MONTH_MARCH:
			monthString = "March"
		Time.MONTH_APRIL:
			monthString = "April"
		Time.MONTH_MAY:
			monthString = "May"
		Time.MONTH_JUNE:
			monthString = "June"
		Time.MONTH_JULY:
			monthString = "July"
		Time.MONTH_AUGUST:
			monthString = "August"
		Time.MONTH_SEPTEMBER:
			monthString = "September"
		Time.MONTH_OCTOBER:
			monthString = "October"
		Time.MONTH_NOVEMBER:
			monthString = "November"
		Time.MONTH_DECEMBER:
			monthString = "December"

	return weekdayString + " " + str(timeDict["day"]) + ", " + monthString + ', ' + str(timeDict["year"])
