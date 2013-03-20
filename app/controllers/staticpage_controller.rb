class StaticpageController < ApplicationController
	layout false
	def index
		@indexlinks = Indexlink.order('ordernum').all
	end
end
