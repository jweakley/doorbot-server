class Credential < ActiveRecord::Base
  enum form: [:rfid]
  after_initialize :set_default_form, if: :new_record?

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
