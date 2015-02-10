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

FactoryGirl.define do
  factory :access_request do
    form "MyString"
key "MyString"
  end

end
