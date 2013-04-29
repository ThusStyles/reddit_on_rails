class ProfilesController < ApplicationController

	def show
		@user = User.find_by_username(params[:username])
	end

	def index
		@user = User.find_by_username(params[:username])
		@user_links = @user.links.paginate(page: params[:page], per_page: 10)

	end

	def all_votes
		@user = User.find_by_username(params[:username])
		@user_votes = @user.votes.paginate(page: params[:page], per_page: 10)
	end

	def all_comments
		@user = User.find_by_username(params[:username])
		@user_comments = @user.comments.paginate(page: params[:page], per_page: 10)
	end
end
