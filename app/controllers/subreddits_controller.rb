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
			render "new"
		end
	end

	def show
		@subreddit = Subreddit.find_by_name(params[:id])
		@toplinks = @subreddit.links.since(Time.now - 48.hours)
		@toplinks2 = @toplinks.where('upvotes_count >= ?', '1')
		@links = @toplinks2.order('upvotes_count desc, created_at desc').paginate(page: params[:page], per_page: 10)

	end

	def recent
		@subreddit = Subreddit.find_by_name(params[:id])
		@recentlinks = @subreddit.links.order('created_at desc').paginate(page: params[:page], per_page: 10)

	end

	def formindex
		# FOR AUTOCOMPLETE
		@subreddit_search = Subreddit.order(:name).where("name like ?", "%#{params[:term]}%")
		render json: @subreddit_search.map(&:name)
	end

	def index
		@subreddits = Subreddit.joins(:links).group('subreddits.id').order('count(links.id) desc').paginate(page: params[:page], per_page: 10)
	end

end
