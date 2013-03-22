class StaticpageController < ApplicationController
	def index
		@indexlinks = Indexlink.order('ordernum').all
	end
end
