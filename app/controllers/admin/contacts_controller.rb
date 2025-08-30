class Admin::ContactsController < Admin::AdminController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /Products
  # GET /Products.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition = {enable: true}

    @contact_count = Contact.where(condition).count
    @contacts = Contact.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /Products/1
  # GET /Products/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /Products/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to admin_contact_path(@contact), notice:  t(:contact, scope: [:activerecord, :models])+t(:message_success_create) }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to admin_contact_path(@contact), notice:  t(:contact, scope: [:activerecord, :models])+t(:message_success_update) }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit( :title, :content, :enable, contact_content_attributes: [:content])
  end
end
