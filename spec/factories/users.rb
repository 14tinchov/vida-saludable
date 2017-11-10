FactoryGirl.define do
  factory :user do
    email                 'user@test.com'
    password              'asdqwe123'
    password_confirmation 'asdqwe123'
  end
end
