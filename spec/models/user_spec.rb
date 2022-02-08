require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should validate user to be present' do
      user = User.new(name: 'Eric', email: 'example@domain.com', password: '123', password_confirmation: '123')
      user.save
      expect(user.email).to eq "example@domain.com"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should validate user with space before and after email' do
      User.create(name: 'Eric', email: 'example@domain.com', password: '123', password_confirmation: '123')
      user = User.authenticate_with_credentials(' example@domain.com ', '123')
      expect(user.email).to eq "example@domain.com"
    end
    it 'should validate user email with wrong case' do
      User.create(name: 'Eric', email: 'example@domain.com', password: '123', password_confirmation: '123')
      user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', '123')
      expect(user.email).to eq "example@domain.com"
    end
  end

end
