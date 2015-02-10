class Credential < ActiveRecord::Base
  has_many :access_controls
  accepts_nested_attributes_for :access_controls

  enum form: [:rfid]
  after_initialize :set_default_form, if: :new_record?

  validates :nickname, presence: true
  validates :key, presence: true, uniqueness: true

  def set_default_form
    self.form ||= :rfid
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
