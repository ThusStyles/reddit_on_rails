class SubredditsController < ApplicationController

	def new
		@subreddit = Subreddit.new
	end

	def create
		@subreddit = Subreddit.new(params[:subreddit])

		if @subreddit.save
			flash[:success] = "#{@subreddit.name} has been created"
			redirect_to @subreddit
		else
			flash[:error] = "#{@subreddit.name} was not created"
			render "new"
		end
	end

	def show
		@subreddit = Subreddit.find_by_name(params[:id])
	end
end
