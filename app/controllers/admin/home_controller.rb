class Admin::HomeController < Admin::AdminController
  def index
    @orders = Order.where(enable: true).limit(5)
  end
end
