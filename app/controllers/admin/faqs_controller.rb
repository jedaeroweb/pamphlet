class Admin::FaqsController < Admin::AdminController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  # GET /faqs
  # GET /faqs.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    category_condition = {enable: true}

    @faq_categories = FaqCategory.where(category_condition)

    if params[:category].present?
      @faq_category = FaqCategory.find(params[:category])
    end

    condition = { }

    if @faq_category.present?
      condition[:faq_category_id] = @faq_category.id
    end

    @faq_count = Faq.where(condition).count
    @faqs = Faq.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show; end

  # GET /faqs/complete
  # GET /faqs/complete.json
  def new
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to admin_faq_path(@faq), notice: t(:faq, scope: [:activerecord, :models])+t(:message_success_create) }
        format.json { render json: @faq, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1
  # PATCH/PUT /faqs/1.json
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to admin_faq_path(@faq), notice: t(:faq, scope: [:activerecord, :models])+t(:message_success_update) }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:faq_category_id, :title, :enable, faq_content_attributes: [:id, :content])
  end
end
