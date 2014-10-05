class AccessControl < ActiveRecord::Base
  belongs_to :doorbot
  belongs_to :credential
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
