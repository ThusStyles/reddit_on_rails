class PagesController < ApplicationController
	def index
		@toplinks = Link.since(Time.now - 48.hours)
		@toplinks2 = @toplinks.where('upvotes_count >= ?', '1')
		@links = @toplinks2.order('upvotes_count desc, created_at desc').paginate(page: params[:page], per_page: 10)
	end

	def recent
		@links = Link.order('created_at desc').paginate(page: params[:page], per_page: 10)
	end
end
