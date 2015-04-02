# == Schema Information
#
# Table name: users
#
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string(255)      default(""), not null, indexed
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)      indexed
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  unlock_token           :string(255)      indexed
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  has_paper_trail
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :trackable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
