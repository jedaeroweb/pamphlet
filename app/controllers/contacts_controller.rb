class ContactsController < ApplicationController
  before_action :authenticate_user!, :except => [:new,:complete,:create, :show]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  
  def complete
  end  

  # GET /contact/new
  def new
    @contact = Contact.new
    @contact_categories=ContactCategory.all
    if(params[:contact_category_id])
      @contact_category_id=params[:contact_category_id]
    end   
    
    @contact.build_contact_content
  end

  # POST /contact
  # POST /contact.json
  def create
    @contact = Contact.new(contact_params)
    @contact_categories=ContactCategory.all

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: @controller_name +t(:message_success_create)}
        format.json { render action: 'complete', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact/1
  # PATCH/PUT /contact/1.json
  def update
    respond_to do |format|
      if @contact.update(notice_params)
        format.html { redirect_to @contact, notice: @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact/1
  # DELETE /contact/1.json
  def destroy
    @contact.destroy
    
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:id,:contact_category_id,:address,:name,:phone,contact_content_attributes: [:id,:content])
  end
end