
FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) {|i| "e#{i}@m.com"}
    name "theop3"
    password "lookaway"
    password_confirmation "lookaway"
  end
end