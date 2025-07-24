class LocationsController < ApplicationController

  def initialize(*params)
    super(*params)
        
    @controller_name=t('activerecord.models.location')
    @script="location"
    @title=t('activerecord.models.location')+t(:title_separator)+t(:application_name)    
    @meta_description=t(:meta_description_intro)
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
