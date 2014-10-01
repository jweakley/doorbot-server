class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :trackable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
