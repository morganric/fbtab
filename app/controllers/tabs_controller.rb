class TabsController < ApplicationController

  layout 'facebook'
  # GET /tabs
  # GET /tabs.json
  def index
    @tabs = Tab.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tabs }
    end
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show

    def base64_url_decode str
       encoded_str = str.gsub('-','+').gsub('_','/')
       encoded_str += '=' while !(encoded_str.size % 4).zero?
       Base64.decode64(encoded_str)
      end

    def decode_data str
     encoded_sig, payload = str.split('.')
     data = ActiveSupport::JSON.decode base64_url_decode(payload)
    end
    


    if params[:signed_request]
      signed_request = params[:signed_request]
      @signed_request = decode_data(signed_request)
      @tab = Tab.find(params[:id])
      @app_data = @signed_request

    else 
      @signed_request = "none"
      @tab = Tab.find(params[:id])
      @app_data = @signed_request
    end

    @params = params

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
