class TwittersController < ApplicationController

	def mostra
		require 'rubygems'
		require 'hpricot'
		require 'open-uri'
		doc = Hpricot(open('http://twitter.com/rr_martins'))
		items = doc / ".hentry .entry-content"
		items.each do |item|
			puts item.inner_text
		end

	end
end

