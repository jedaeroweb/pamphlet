class ContactsController < ApplicationController
  before_action :authenticate_user!, :except => [:new,:complete,:create, :show]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def initialize(*params)
    super(*params)

    @application_name=t(:application_name)
    @controller_name= t(:contact, scope: [:activerecord, :models])
    @title=@controller_name
  end
  
  def complete
  end  

  # GET /contact/new
  def new
    @contact = Contact.new
    if params[:contact_category_id]
      @contact_category_id=params[:contact_category_id]
    end
  end

  # POST /contact
  # POST /contact.json
  def create
    ActiveRecord::Base.transaction do
      # 로그인한 경우: 폼의 name/email은 무시하고 현재 사용자에 연결
      if user_signed_in?
        user = current_user
      else
        # 비로그인: 폼에서 넘어온 고객 정보만 안전하게 추출
        customer_params = params.require(:contact).permit(:name, :phone, :email)
        nickname  = customer_params[:name].to_s.strip
        phone  = customer_params[:phone].to_s.strip
        email = customer_params[:email].to_s.strip.downcase

        if email.blank?
          email=set_dummy_email
        end

        # 이메일 기준으로 사용자 찾거나 생성
        user = User.find_or_initialize_by(email: email)
        if user.new_record?
          user.nickname        = nickname
          user.email       = email
          user.phone       = phone
          user.password    = SecureRandom.base64(12)
          user.save!
        else
          user.update!(name: name) if user.name.blank? && name.present?
        end
      end

      @contact = Contact.new(contact_params)
      @contact.user = user
      @contact.content = @contact.raw_content

      if @contact.save
        redirect_to @contact, notice: '문의가 등록되었습니다.'
      else
        render :new, status: :unprocessable_content
      end

    rescue ActiveRecord::RecordInvalid => e
      @contact ||= Contact.new(contact_params)
      @contact.errors.add(:base, e.record.errors.full_messages.to_sentence)
      render :new, status: :unprocessable_content
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
    params.require(:contact).permit(:id, :name, :phone, :email,:contact_category_id,:raw_content)
  end

  def set_dummy_email
    timestamp = Time.now.to_i
    email = "dummy-#{timestamp}-#{rand(1000..9999)}@jedaeroweb.co.kr"
  end
end