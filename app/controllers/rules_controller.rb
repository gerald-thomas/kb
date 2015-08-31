class RulesController < ApplicationController
	def index
		@rules=Rule.all
		if not(@rules)
				redirect_to new_rule_path
			end
	end
	def show
		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
		#will render with show.html.haml by default
	end
	def new
		#default: render 'new' template
		id = params[:parent_id]
		if id
			@parent = Rule.find(id)
		end
		@rule= Rule.new(:parent_id => id)
	end
	def create
		rule=	params[:rule]
		branch=	params[:branch] #have to do this separately because of use of check box tag
		rule=	params[:rule].merge!(branch: branch) #merge check box value into rule form values
		@rule = Rule.create!(rule_params)
		flash[:notice] ="#{@rule.name} was successfully created"
		redirect_to rules_path
	end
	def edit
		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
	end
	def update
		id = 	params[:id]
		branch=	params[:branch] #have to do this separately because of use of check box tag
		rule=	params[:rule].merge!(branch: branch) #merge check box value into rule form values
		@rule = Rule.find id
		@rule.update_attributes!(rule_params)
		flash[:notice]  ="#{@rule.name} was successfully updated"
		if @rule.parent
			redirect_to tree_path(@rule.parent)
		else
			redirect_to tree_path(@rule)
		end
	end
	def destroy
		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
		@rule.destroy
		flash[:notice] = "Rule: '#{@rule.name}' deleted"
		redirect_to rules_path
	end
	def tree
		id = params[:id] # retrieve rule ID from route
		if id
			@rule = Rule.find(id)  #look up rule by unique ID
		else
			@rule = Rule.find(1)  #look up rule by unique ID
		end
	end

	def run

		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
		#book = Spreadsheet.open @rule.excel
		book= Documents::XlsBuilder::read_file @rule.excel
		data_sheet = book.worksheet("Data")
		data_title_row = data_sheet.row(0)
		eval_sheet = book.worksheet("Tests")
		eval_title_row = eval_sheet.row(0)		
		flash[:notice] = "'#{@rule.excel}' successfully opened"
		run_tickets = Ticket.all   # eventually should be set by user
		run_tickets.each do |tix|
			# col_number = 0
			# #tix #so that it is in scope in the outer do loop
			# data_title_row.each do |col|
			# 	#data_sheet [1,col_number] = tix[col]  #kludgy way to download data
			# 	eval_sheet [1,col_number] = tix[col]  #kludgy way to download data
			# 	col_number += 1
			# end
			# # Excel calculates values and results are in Tests worksheet
			# # store results with Ticket
			# col_number = 0
			# byebug
			# eval_title_row.each do |col|
			# 	if eval_sheet [1,col_number]  #kludgy way to upload data

			# 		tix[col] = true
			# 	else
			# 		tix[col] = false
			# 	end
			# 	col_number += 1
			# end
			#flash[:notice] = "Was here"
			# now clasify ticket
			#@rule_eval = tix[@rule.test]  #tix goes down the True or False branch
			# find the branch corresponding to the evaluation
			classification = classify(tix, @rule)
			# tix.branch =classification[:branch]
			# tix.rule = classification[:rule]
			#tix.save
			
		end


			
		#byebug
		redirect_to tree_path(@rule)
	end

	def classify (tix, test_rule)
		rule_eval = tix[test_rule.test] #evaluates to true or false
		child_rules = test_rule.children.where( :branch => rule_eval)
		if child_rules.first #.first to get to actual rule rather than a Relation see http://stackoverflow.com/questions/4426441/rails-3-active-record-query-returns-activerecordrelation-object-instead-of-o
			child_rules.each do |child_rule|
				classification = classify(tix,child_rule)
			end
		else
			# if rule_eval
			# 	test_rule.count_positive += 1
			# else
			# 	test_rule.count_negative += 1
			# end
			#{:branch=> rule_eval, :rule => test_rule.id}
			tix.branch = rule_eval
			tix.rule = test_rule.id
			tix.save
		end
	end

	def count
		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
		rules = Rule.all
		rules.each do |rule| #reset count
			rule.count_positive = 0
			rule.count_negative = 0
			rule.save
		end

		summary =Ticket.select('rule, branch, count(ticket) as count').group('rule', 'branch')
		summary.each do |node_rule|
			@node_rule = Rule.find(node_rule.rule)
			if node_rule.branch==TRUE
				@node_rule.count_positive = node_rule.count
			else
				@node_rule.count_negative = node_rule.count
			end
			@node_rule.save
		end
		redirect_to tree_path(@rule)
	end


	private

	def rule_params
		params.require(:rule).permit(:parent_id, :name, :test, :excel, :branch)
	end




end