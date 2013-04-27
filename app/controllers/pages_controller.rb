class PagesController < ApplicationController
	def index
		@toplinks = Link.where('upvotes_count >= ?', '1')
		@links = @toplinks.order('upvotes_count desc, created_at desc').paginate(page: params[:page], per_page: 8)
	end

	def recent
		@links = Link.order('created_at desc').paginate(page: params[:page], per_page: 8)
	end
end
