
FactoryGirl.define do

  factory :question do
    title 'this is a question about rails'
    body 'is it better to use password_digest?'



  end

  factory :user do
    email 'test@example.com'
    username 'testexample'
    password ('testpassword')
 end

 factory :answer do
   response 'this is the answer'
 end




end
