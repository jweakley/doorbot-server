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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credential do
    type 1
    nickname "MyString"
    key "MyString"
  end
end
