class PagesController < ApplicationController
	def index
		@toplinks = Link.since(Time.now - 96.hours)
		@toplinks2 = @toplinks.where('upvotes_count >= ?', '1')
		@links = @toplinks2.order('upvotes_count desc, created_at desc').paginate(page: params[:page], per_page: 10)
	end

	def recent
		@links = Link.order('created_at desc').paginate(page: params[:page], per_page: 10)
	end

	def home
		if current_user.present? || user_signed_in?
			redirect_to fronttop_path
		end
	end
end
