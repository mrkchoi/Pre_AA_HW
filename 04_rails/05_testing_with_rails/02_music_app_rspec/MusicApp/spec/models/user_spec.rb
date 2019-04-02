require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    let(:user) { User.new(email: 'mrkchoi@gmail.com')}

    it 'should check for correct passwords via BCrypt' do 
      user.password = 'testing'
      expect(user.is_password?('testing')).to eq(true)
    end

    it 'should return false if password is incorrect' do
      user.password = 'testing'
      expect(user.is_password?('test123')).to eq(false)
    end
  end

  describe '#reset_session_token' do
    let(:user) { User.new(email: 'mrkchoi@gmail.com')}

    it 'should reset the session token for a user' do
      session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(session_token)
    end
  end

  describe '::find_by_credentials' do
    let(:user) { User.new(email: 'mrkchoi@gmail.com')}


    it 'should find a user by username and password' do
      user.password = 'testing'
      user.save
      expect(User.find_by_credentials('mrkchoi@gmail.com', 'testing')).not_to eq(nil)
    end

    it 'should return nil with incorrect credentials' do
      user.password = 'testing'
      user.save
      expect(User.find_by_credentials('mrkchoi@gmail.com', 'wrong_pass')).to eq(nil)
    end
  end
end
