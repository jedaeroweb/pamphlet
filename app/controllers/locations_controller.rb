class LocationsController < ApplicationController
  def initialize(*params)
    super(*params)

    @application_name=t(:application_name)
    @controller_name= t(:location, scope: [:activerecord, :models])
    @title=@controller_name
  end

  # GET /intro
  # GET /intro.json  
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user }
    end
  end
end
