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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doorbot do
    nickname "MyString"
    api_key "MyString"
  end
end
