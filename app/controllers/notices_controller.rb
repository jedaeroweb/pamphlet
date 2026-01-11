class NoticesController < ApplicationController
  impressionist :actions => [:show]
  before_action :authenticate_user!, :except => [:index,:show]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  def initialize(*params)
    super(*params)

    @application_name=t(:application_name)
    @controller_name= t(:notice, scope: [:activerecord, :models])
    @title=@controller_name
  end
  # GET /notices
  # GET /notices.json
  def index
    if params[:search_detail].present?
      session[:search_detail]=1
    else
      if params[:search_summary].present?
        session.delete(:search_detail)
      end
    end

    if params[:list_type].present?
      if params[:list_type]=='list'
        session[:notice_list_type]='list'
      else
        session[:notice_list_type]='module'
      end
    end


    condition = { enable: true }

    @notice_count = Notice.where(condition).count
    @notices = Notice.where(condition).page(params[:page]).per(params[:per_page]).order('id desc')


    respond_to do |format|
      format.html # _slide.html.erb
      format.json { render json: @notices }
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/complete
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to [ @notice], notice: t(:notice, scope: [:activerecord, :models])+t(:message_success_create) }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render action: 'new' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to [ @notice], notice: t(:notice, scope: [:activerecord, :models])+t(:message_success_update) }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to admin_notices_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notice_params
    params.require(:notice).permit(:title, :popup, :enable, :content).merge(user_id: current_user.id)
  end
end
