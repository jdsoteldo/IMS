class User < ApplicationRecord
  has_many :tables
  after_create :assign_default_role
  rolify

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
