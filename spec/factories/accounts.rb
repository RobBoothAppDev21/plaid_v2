# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { "Pretoria Checking Account" }
    plaid_account_id { "BxBXxLjlm4HMXBm9WZZmCWVbPJX16EHwv99vp" }
    mask { "0000" }
    currency_code { "USD" }
    account_subtype { "checking" }
    account_type { "depository" }
    current_balance_cents { 250.00 }
    available_balance_cents { 225.00 }
    limit_cents { 400.00 }
    association :item
  end
end
