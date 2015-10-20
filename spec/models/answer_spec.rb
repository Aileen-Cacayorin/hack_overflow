require 'rails_helper'

describe Answer do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should validate_presence_of :response }

  describe '#upvote' do
    it 'increases the vote count by 1' do
      answer = FactoryGirl.create(:answer)
      answer.upvote
      expect(answer.votes).to eq 1
    end
  end

  describe '#downvote' do
    it 'decreases the vote count by 1' do
      answer = FactoryGirl.create(:answer)
      answer.downvote
      expect(answer.votes).to eq -1
    end
  end
end
