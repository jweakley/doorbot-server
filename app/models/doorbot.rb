class Doorbot < ActiveRecord::Base

  before_validation :generate_key

  validates :api_key, presence: true, uniqueness: true
  validates :nickname, presence: true

  has_many :access_controls
  has_many :access_requests
  has_many :credentials, through: :access_controls

  protected

  def generate_key
    loop do
      self.api_key = SecureRandom.hex
      break unless key_already_exists?(api_key)
    end
  end

  def key_already_exists?(key)
    self.class.exists?(api_key: key)
  end
end

# == Schema Information
#
# Table name: doorbots
#
#  api_key    :string(255)      indexed
#  created_at :datetime
#  id         :integer          not null, primary key
#  nickname   :string(255)
#  updated_at :datetime
#
