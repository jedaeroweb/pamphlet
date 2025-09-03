class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :nickname, :phone
  validates_uniqueness_of :email
  has_many :notice, :dependent=> :destroy
  has_many :blog, :dependent=> :destroy
  has_one :user_picture, dependent: :destroy
  accepts_nested_attributes_for :user_picture, allow_destroy: true

  def admin?
    admin
  end
end
