# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email, 20) { |n| "user-#{n}@gmail.com" }
    # email { "user-1@gmail.com" }
    password { "secret-password" }
  end
end
