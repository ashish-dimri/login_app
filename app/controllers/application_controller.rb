class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	def index
		# render html: "Welcome to devise implementation"
	end
end
