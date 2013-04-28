module ApplicationHelper

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
	end

	def gravatar_url(email)
		gravatar_id = Digest::MD5.hexdigest(email.strip.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}"
	end
end
