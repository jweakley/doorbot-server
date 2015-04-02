class AccessControl < ActiveRecord::Base
  has_paper_trail
  belongs_to :doorbot
  delegate :nickname, to: :doorbot, prefix: true
  belongs_to :credential
  delegate :nickname, to: :credential, prefix: true
end

# == Schema Information
#
# Table name: access_controls
#
#  created_at    :datetime
#  credential_id :integer          indexed
#  doorbot_id    :integer          indexed
#  id            :integer          not null, primary key
#  updated_at    :datetime
#
