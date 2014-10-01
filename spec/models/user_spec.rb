require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should default to regular user' do
    expect(User.new.user?).to be true
  end
end
