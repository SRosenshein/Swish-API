FactoryGirl.define do
    factory :user do
        email { FFaker::Internet.email }
        password "helloworld"
        password_confirmation "helloworld"
    end
end