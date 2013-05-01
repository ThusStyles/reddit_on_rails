# Load the rails application
require File.expand_path('../application', __FILE__)
ENV["AWS_SECRET_KEY_ID"] = "AKIAJT7R66AISFQTILBA"
ENV["AWS_SECRET_ACCESS_KEY"] = "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"
ENV["AWS_S3_BUCKET"] = "reddit-on-rails"
# Initialize the rails application
RedditOnRails::Application.initialize!
