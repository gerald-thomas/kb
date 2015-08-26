tickets = Ticket.all
tickets.each do |tix|
	tix.test1 = rand(0..1)
	tix.test2 = rand(0..1)
	tix.test3 = rand(0..1)
	tix.test4 = rand(0..1)
	tix.test5 = rand(0..1)
	tix.test6 = rand(0..1)
	tix.test7 = rand(0..1)
	tix.test8 = rand(0..1)
	tix.test9 = rand(0..1)
	tix.test10 = rand(0..1)
	tix.save
end
