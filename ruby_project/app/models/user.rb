class User < ApplicationRecord
  devise :database_authenticatable, #:registerable,
         #:recoverable,
         :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def admin?
    role == "admin"
  end

  def manager?
    role == "manager"
  end

  def employee?
    role == "employee"
  end
end
