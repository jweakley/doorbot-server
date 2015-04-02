class AccessRequest < ActiveRecord::Base
  belongs_to :doorbot
  delegate :nickname, to: :doorbot, prefix: true

  def credential
    Credential.find_by(form: form, key: key)
  end

  def access_control_exists?
    AccessControl.where(credential: credential, doorbot: doorbot).exists?
  end
end

# == Schema Information
#
# Table name: access_requests
#
#  access_granted :boolean          default(FALSE)
#  created_at     :datetime         not null
#  doorbot_id     :integer          indexed
#  form           :string
#  id             :integer          not null, primary key
#  key            :string
#  updated_at     :datetime         not null
#
