class HomeController < ApplicationController
  def index
    @users = User.all

    @mixcloud = Mixcloud::User.new('http://api.mixcloud.com/mixcloud')
    @cloudcasts_url = @mixcloud.cloudcasts_url


    # @cloudcasts = []
    # @cloudcasts.each do |cloudcast|
    # 	cloudcast = Mixcloud::Cloudcast.new()
    # end

    @cloudcast = Mixcloud::Cloudcast.new('http://api.mixcloud.com/rico-casazza/cinematic-mix-vol-ii/')

    if params.empty?
	    @results = {}	
	else
		# @results = Mixcloud::Search.find_artist(params[:artist])
	end
  end
end
