class StaticpageController < ApplicationController
	def index
		@indexlinks = Indexlink.with_translations(I18n.locale).order('ordernum').all
	end
end
