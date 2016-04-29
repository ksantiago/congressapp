class RepresentativesController < ApplicationController

	def index
    url = "http://congress.api.sunlightfoundation.com"
    method="/legislators?per_page=all"
    @results = HTTParty.get(url+method+"&apikey=4de2182bd09f415ca903b749345bffc5}")["results"]
    binding.pry
	end

	def show
		# this is to populate info for a particular legislator, found through bioguide_id
    url = "http://congress.api.sunlightfoundation.com"
    method="/legislators?per_page=all"
    @results = HTTParty.get(url+method+"&apikey=#{ENV['sunlight_key']}")["results"].select { |result| result['bioguide_id'] == "#{@id}" }
	end

end
