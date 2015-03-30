class Credential < ActiveRecord::Base
  has_paper_trail
  has_many :access_controls
  accepts_nested_attributes_for :access_controls

  enum form: [:rfid]
  after_initialize :set_default_attributes, if: :new_record?

  validates :nickname, presence: true
  validates :key, presence: true, uniqueness: true

  def set_default_attributes
    self.form ||= :rfid
    self.nickname ||= "Keycard #{(Credential.last.try(:id) || 0 ) + 1}"
  end
end

# == Schema Information
#
# Table name: credentials
#
#  created_at :datetime
#  form       :integer
#  id         :integer          not null, primary key
#  key        :string(255)
#  nickname   :string(255)
#  updated_at :datetime
#
