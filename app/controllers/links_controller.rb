class LinksController < ApplicationController

	before_filter :authenticate_user!, only: [:new, :destroy, :edit, :update]

	def show
		@link = Link.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@link = Link.find(params[:id])

	end

	def update
		@link = Link.find(params[:id])
		if @link.update_attributes(params[:link])
			flash[:success] = "Successfully updated"
			redirect_to @link
		else
			flash[:error] = "Could not update"
			render "edit"
		end
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
