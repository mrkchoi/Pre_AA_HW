# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }


  describe '::find_by_credentials' do
    let(:user) {User.new(username: 'test')}
    

    context 'invalid user params' do
      it 'should return nil for an invalid username & password' do
        user.password = 'testing'
        user.save
        expect(User.find_by_credentials('test', 'testing123')).to eq(nil)
      end
    end

    context 'valid user params' do
      it 'should return the correct user by username & password' do
        user.password = 'testing'
        user.save
        expect(User.find_by_credentials('test', 'testing')).to eq(User.find_by(username: 'test'))
      end
    end
  end
end

