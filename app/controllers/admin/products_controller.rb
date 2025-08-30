class Admin::ProductsController < Admin::AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /Products
  # GET /Products.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    category_condition = {enable: true}

    @product_categories = ProductCategory.where(category_condition)

    if params[:category].present?
      @product_category = ProductCategory.find(params[:category])
    end

    condition = { }

    if @product_category.present?
      condition[:product_category_id] = @product_category.id
    end

    @product_count = Product.where(condition).count
    @products = Product.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /Products/1
  # GET /Products/1.json
  def show
  end

  # GET /Products/new
  def new
    @product = Product.new
  end

  # GET /Products/1/edit
  def edit
  end

  # POST /Products
  # POST /Products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        @product.product_pictures.build

        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Products/1
  # PATCH/PUT /Products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_path(@product), notice: 'product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        unless @product.product_pictures.present?
          @product.product_pictures.build
        end

        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Products/1
  # DELETE /Products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:company_id, :product_category_id, :title, :content, :price, :discount, :enable, speciality_category_ids: [], product_pictures_attributes: [:id, :picture])
  end
end
