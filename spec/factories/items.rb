# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    association :user
    access_token { "access-sandbox-de3ce8ef-33f8-452c-a685-8671031fc0f6" }
    plaid_item_id { "Ed6bjNrDLJfGvZWwnkQlfxwoNz54B5C97ejBr" }
    bank_name { "Chase" }
    transactions_cursor { "" }
    is_active { true }
    institution_id { "BNK_01" }
  end
end
