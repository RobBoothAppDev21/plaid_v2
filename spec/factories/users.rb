# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # sequence(:username, 10) { |n| "user-#{n}" }
    email { "user-1@gmail.com" }
    password { "secret-password"}
  end
end