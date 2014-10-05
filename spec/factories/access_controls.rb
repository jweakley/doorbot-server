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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :access_control do
    doorbot nil
    credential nil
  end
end
