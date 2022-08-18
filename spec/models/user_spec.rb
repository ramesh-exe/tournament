require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do

    it 'username present' do
      user = User.new(email: "test@test.com", password: "password").save
      expect(user).to eq(false)
    end

    it 'email present' do
      user = User.new(username: "test", password: "password").save
      expect(user).to eq(false)
    end

    it 'password present' do
      user = User.new(username: "test", email: "test@test.com").save
      expect(user).to eq(false)
    end

    it 'create user' do
      user = User.new(username: "test", email: "test@test.com", password: "password").save
      expect(user).to eq(true)
    end
  end
end
