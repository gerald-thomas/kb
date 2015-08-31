class BucketsController < ApplicationController
  def show
  	@buckets = Ticket.select('rule, branch, count(ticket) as count').group('rule', 'branch').order('branch asc')
  	@buckets_total = Ticket.select('branch, count(ticket) as count').group('branch').order('branch asc')
  end
  def detail
	@rule= Rule.find(params[:rule])
	@branch= params[:branch] ? "True":"False"
	@tickets = Ticket.where("rule = ? and branch = ?", params[:rule], params[:branch])
  end
end
