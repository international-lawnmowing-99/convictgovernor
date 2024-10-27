class_name Building

extends Resource

var freeEmployees:Array
var convictEmployeed:Array[Person]

var production:int
var stockPile:int
var businessCash:float

func GameDay():
	if true:# if there's enough raw materials and labour
		pass # make stuff
		stockPile += production

func Sell(amountRequested:int, price:float):
	var amountProcessed:int = amountRequested
	if amountRequested > stockPile:
		amountProcessed = stockPile

	businessCash+=price*amountRequested
	stockPile -= amountProcessed
