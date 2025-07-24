# encoding: utf-8

class ContactsController < BoardController
  before_action :authenticate_user!, :except => [:new,:create,:show]  
  impressionist :actions=>[:show]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :set_ad, only: [:index, :show]  

  def initialize(*params)
    super(*params)
    @controller_name=t('activerecord.models.contact')
    @script="contact"
  end

  # GET /notices
  # GET /notices.json
  def index
    @contacts = Contact.order('id desc').page(params[:page]).per(10)
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end
  
  def complete
  end  

  # GET /notices/new
  def new
    @contact = Contact.new
    @contact_categories=ContactCategory.all
    if(params[:contact_category_id])
      @contact_category_id=params[:contact_category_id]
    end   
    
    @contact.build_contact_content
        
    @script="contact"
  end

  # GET /notices/1/edit
  def edit
    @script="board/edit"  
  end

  # POST /notices
  # POST /notices.json
  def create
    @contact = Contact.new(contact_params)
    @contact_categories=ContactCategory.all
    @script="board/new"       

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

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    @script="board/edit"
  
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

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @contact.destroy
    
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @contact = Contact.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:id,:contact_category_id,:address,:name,:phone,contact_content_attributes: [:id,:content])
  end
end