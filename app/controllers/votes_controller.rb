class VotesController < ApplicationController
	before_filter :authenticate_user!, only: [:create]

	

	def create
		@vote = Vote.where(link_id: params[:vote][:link_id], user_id: current_user.id).first
		@link = Link.find_by_id(params[:vote][:link_id])

		@link.upvotes_count += params[:vote][:vote_value].to_f

		@link.save
		


		if @vote

			@vote.vote_value = params[:vote][:vote_value]

			if @vote.vote_value == -1
				@vote.destroy
			elsif @vote.vote_value == 1
				@vote.destroy
			else
				@vote.save
			end


			
		else
			@vote = current_user.votes.create(params[:vote])
		end
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
		
	end

	def create_comment
		
	end	
end
