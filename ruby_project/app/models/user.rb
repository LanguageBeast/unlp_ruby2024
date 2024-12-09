class User < ApplicationRecord
  devise :database_authenticatable, #:registerable,
         #:recoverable,
         :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  scope :active, -> { where(deleted: false) }

  def admin?
    role == "admin"
  end

  def manager?
    role == "manager"
  end

  def employee?
    role == "employee"
  end

  def deactivate
    random_password = SecureRandom.hex(32)
    update(deleted: true, password: random_password)
  end
end
