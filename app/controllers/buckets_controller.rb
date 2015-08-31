class BucketsController < ApplicationController
  def show
  	@buckets = Ticket.select('rule, branch, count(ticket) as count').group('rule', 'branch')
  end
  def detail
	@rule= Rule.find(params[:rule])
	@branch= params[:branch]
	@tickets = Ticket.where("rule = ? and branch = ?", params[:rule], params[:branch])
  end
end
