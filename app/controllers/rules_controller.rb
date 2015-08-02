class RulesController < ApplicationController
	def index
		@rules=Rule.all
	end
	def show
		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
		#will render with show.html.haml by default
	end
	def new
		#default: render 'new' template
		id = params[:parent_id]
		@parent = Rule.find(id)
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
		redirect_to rules_path
	end
	def destroy
		id = params[:id] # retrieve rule ID from route
		@rule = Rule.find(id)  #look up rule by unique ID
		@rule.destroy
		flash[:notice] = "Rule: '#{@rule.name}' deleted"
		redirect_to rules_path
	end

	private

	def rule_params
		params.require(:rule).permit(:parent_id, :name, :test, :excel, :branch)
	end

end