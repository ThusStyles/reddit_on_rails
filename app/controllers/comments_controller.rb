class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:create]

	def show

	end

	def new
	end

	def create
		@comment = Comment.create(params[:comment])
		flash[:success] = "Your comment was posted"
		redirect_to :back
	end
end
