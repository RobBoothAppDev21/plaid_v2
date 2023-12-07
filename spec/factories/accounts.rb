# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { "Pretoria Checking Account" }
    plaid_id { "BxBXxLjlm4HMXBm9WZZmCWVbPJX16EHwv99vp" }
    current_balance { 250.00 }
    available_balance { 225.00 }
    limit { 400.00 }
    currency_code { "USD" }
    account_subtype { "checking" }
    account_type { "depository" }
    association :item
  end
end
