class TabsController < ApplicationController
# does_facebook
  layout 'facebook'

  # GET /tabs
  # GET /tabs.json
  def index

    @facebook = false
    @tabs = Tab.all
    # @tab = Tab.first

    @rg = RestGraph.new( :app_id => 489815807777705, :secret => "82e850fde7ac14a81c6ab2c64ffee153")
    
    if params["signed_request"]
      @facebook = true
      @parsed_request = @rg.parse_signed_request!(params["signed_request"])
      # @app_data = @parsed_request[:app_data]
      # @page_id = @parsed_request[:page][:id]
      @request_id = @parsed_request["page"]["id"]
    else
      @parsed_request = "NO SIGNED REQUEST"
      @request_id = "204412169722012"
    end
 
    @tab = Tab.find_by_fb_page_id(@request_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tabs }
    end
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show

    @tab = Tab.find(params[:id])
    # @graph = Koala::Facebook::API.new("CAAG9fCE6W6kBAMLEyRb2vMPLSweauJvQGo3ciYDcsx8nRoizUrAyShsok0VjQbTMZA2dKiGSpV8y9YlTowlfEH0FLVNcrtnSvfZAOKq7S4YIVqGZBum7M1EwqiFPdZAa86VKTn93LJD4shPJcdtmalPXc6c8rYE15SsevQUkDjl2yIcQZBlBrdH3YxwnMUHN4JVRpwnUMNQZDZD")
    # @profile = @graph.get_object("me")
    

    @rg = RestGraph.new( :app_id => 489815807777705, :secret => "82e850fde7ac14a81c6ab2c64ffee153")
    if params["signed_request"]
      @parsed_request = @rg.parse_signed_request!(params["signed_request"])
      # @app_data = @parsed_request[:app_data]
      # @page_id = @parsed_request[:page][:id]

    end

   

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tab }
    end
  end


  # GET /tabs/new
  # GET /tabs/new.json
  def new
    @tab = Tab.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tab }
    end
  end

  # GET /tabs/1/edit
  def edit
    @tab = Tab.find(params[:id])
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @tab = Tab.new(params[:tab])

    respond_to do |format|
      if @tab.save
        format.html { redirect_to @tab, notice: 'Tab was successfully created.' }
        format.json { render json: @tab, status: :created, location: @tab }
      else
        format.html { render action: "new" }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tabs/1
  # PUT /tabs/1.json
  def update
    @tab = Tab.find(params[:id])

    respond_to do |format|
      if @tab.update_attributes(params[:tab])
        format.html { redirect_to @tab, notice: 'Tab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy

    respond_to do |format|
      format.html { redirect_to tabs_url }
      format.json { head :no_content }
    end
  end

end
