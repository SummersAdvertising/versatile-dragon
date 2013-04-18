class StaticpageController < ApplicationController
	def index
		@indexlinks = Indexlink.with_translations(I18n.locale).order('ordernum').limit(8)
	end
end
