# encoding: utf-8

class TeamsController < ApplicationController
  before_action :authenticate_user!, :except => [:index,:show] 

  def initialize(*params)
    super(*params)
        
    @controller_name=t('activerecord.models.team')
    
    @title=t('activerecord.models.team')+t(:title_separator)+t(:application_name)    
    @meta_description=t(:meta_description_team)
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
