class JssdkController < ApplicationController
layout 'facebook'
	
def index
	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tabs }
    end
end

end
