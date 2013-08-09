class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  unless Rails.env.production?
	  ENV['FB_APP_ID'] = '213223128832848'
	  ENV['HTTP_PASS'] = 'testpass'
  end

end
