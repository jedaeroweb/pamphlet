class Admin::BlogCategoriesController < Admin::AdminController
  before_action :set_blog_category, only: [:show, :edit, :update, :destroy]

  # GET /blog_categories
  # GET /blog_categories.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition={}

    @blog_category_count = BlogCategory.where(condition).count
    @blog_categories = BlogCategory.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')
  end

  # GET /blog_categories/1
  # GET /blog_categories/1.json
  def show
  end

  # GET /Products/complete
  def new
    @blog_category = BlogCategory.new
  end

  # GET /Products/1/edit
  def edit
  end

  # POST /blog_categories
  # POST /blog_categories.json
  def create
    @blog_category = BlogCategory.new(blog_category_params)

    respond_to do |format|
      if @blog_category.save
        format.html { redirect_to admin_blog_categories_path, notice: 'blog category was successfully created.' }
        format.json { render :show, status: :created, location: @blog_category }
      else
        format.html { render :show }
        format.json { render json: @blog_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_categories/1
  # PATCH/PUT /blog_categories/1.json
  def update
    respond_to do |format|
      if @blog_category.update(blog_category_params)
        format.html { redirect_to admin_blog_category_path(@blog_category), notice: 'blog category was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_category }
      else
        format.html { render :edit }
        format.json { render json: @blog_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_categories/1
  # DELETE /blog_categories/1.json
  def destroy
    @blog_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_blog_categories_url, notice: 'blog category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_category
    @blog_category = BlogCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blog_category_params
    params.require(:blog_category).permit(:title, :enable)
  end
end
