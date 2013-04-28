class LinksController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :destroy]

	def show
		@link = Link.find(params[:id])
		@comment = Comment.new
	end

	def new
		@link = Link.new
		@subreddits = Subreddit.all
	end

	def destroy
		@link = Link.find(params[:id])
		@link.destroy
		flash[:error] = "The link was deleted"
		redirect_to :back
		
	end

	def create
		
		@link = Link.new(params[:link])
			if @link.save
				flash[:success] = "The link has been posted"
				redirect_to @link
			else
				flash[:error] = "The link was not posted"
				render 'new'
			end


		
	end

	def create_message
			@link = Link.new(params[:link])
				if @link.save
					flash[:success] = "The link has been posted"
					redirect_to @link
				else
					flash[:error] = "The link was not posted"
					render 'new'
				end
		end
end
