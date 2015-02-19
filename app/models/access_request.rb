class AccessRequest < ActiveRecord::Base
  belongs_to :doorbot
  delegate :nickname, to: :doorbot, prefix: true

  def credential
    Credential.find_by(form: form, key: key)
  end
end

# == Schema Information
#
# Table name: access_requests
#
#  access_granted :boolean          default("false")
#  created_at     :datetime         not null
#  doorbot_id     :integer          indexed
#  form           :string
#  id             :integer          not null, primary key
#  key            :string
#  updated_at     :datetime         not null
#
