class SearchController < ApplicationController
	def index
		@links = Link.advanced_search(title: params[:q])
	end
end
