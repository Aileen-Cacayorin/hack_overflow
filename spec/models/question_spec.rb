require 'rails_helper'

describe Question do
  it { should validate_presence_of :title}
  it { should validate_presence_of :body}

  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }

  describe '#upvote' do
    it 'increases the vote count by 1' do
      question = FactoryGirl.create(:question)
      question.upvote
      expect(question.votes).to eq 1
    end
  end

  describe '#downvote' do
    it 'decreases the vote count by 1' do
      question = FactoryGirl.create(:question)
      question.downvote
      expect(question.votes).to eq -1
    end
  end

end
