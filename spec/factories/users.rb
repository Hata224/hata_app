FactoryBot.define do
  factory :user do
    name { 'Testuser' }
    sequence(:email) { |n| "test#{n}@example.com"}
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
