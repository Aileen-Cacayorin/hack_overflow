require 'rails_helper'

describe User do
  it {should validate_uniqueness_of :email}
  it {should validate_uniqueness_of :username}
  it {should have_many :questions }


  it 'is not an admin by default' do
    user = FactoryGirl.create(:user)
    expect(user.admin?).to eq false
  end

  it "sends an email when the user is created" do
    user = FactoryGirl.create(:user)
    ActionMailer::Base.deliveries.expect(last).to eq [user.email]
  end

end
