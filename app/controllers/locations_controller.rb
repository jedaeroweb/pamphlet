class LocationsController < ApplicationController
  # GET /intro
  # GET /intro.json  
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user }
    end
  end
end
