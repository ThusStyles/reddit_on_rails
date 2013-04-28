class SubredditsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create]
	def new
		@subreddit = Subreddit.new
	end

	def create
		@subreddit = Subreddit.new(params[:subreddit])

		if @subreddit.save
			flash[:success] = "#{@subreddit.name} has been created"
			redirect_to @subreddit
		else
			flash[:error] = "#{@subreddit.name} has already been taken"
			render "new"
		end
	end

	def show
		@subreddit = Subreddit.find_by_name(params[:id])
		@toplinks = @subreddit.links.order('upvotes_count desc, created_at desc')
	end

	def recent
		@subreddit = Subreddit.find_by_name(params[:id])
		@recentlinks = @subreddit.links.order('created_at desc')

	end

end
