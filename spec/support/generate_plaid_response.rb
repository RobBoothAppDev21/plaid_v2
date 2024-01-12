# frozen_string_literal: true

module GeneratePlaidResponse
  class << self
    def item_metadata(**institution_options)
      {
        institution: {
          name: 'Wells Fargo',
          institution_id: 'ins_4',
          **institution_options,
        },
        accounts: [
          {
            id: 'ygPnJweommTWNr9doD6ZfGR6GGVQy7fyREmWy',
            name: 'Plaid Checking',
            mask: '0000',
            type: 'depository',
            subtype: 'checking',
            verification_status: ''
          },
          {
            id: '9ebEyJAl33FRrZNLBG8ECxD9xxpwWnuRNZ1V4',
            name: 'Plaid Saving',
            mask: '1111',
            type: 'depository',
            subtype: 'savings'
          }
        ],
        link_session_id: '79e772be-547d-4c9c-8b76-4ac4ed4c441a'
      }.to_json
    end

    def public_token_exchange_response(**options)
      {
        "access_token": "access-sandbox-de3ce8ef-33f8-452c-a685-8671031fc0f6",
        "item_id": "M5eVJqLnv3tbzdngLDp9FL5OlDNxlNhlE55op",
        "request_id": "Aim3b",
        **options,
      }.to_json
    end

    def plaid_account_object
      Struct.new(
        "Account", :account_id, :balances, :mask, :name,
        :official_name, :persistent_account_id, :subtype, :type
      )
      Struct.new("Balances", :available, :current, :iso_currency_code, :limit, :unofficial_currency_code )

      Struct::Account.new(
        "BxBXxLj1m4HMXBm9WZZmCWVbPjX16EHwv99vp",
        Struct::Balances.new(100, 110, "USD", nil, nil),
        "0000",
        "Plaid Checking",
        "Plaid Gold Standard 0% Interest Checking",
        "8cfb8beb89b774ee43b090625f0d61d0814322b43bff984eaf60386e",
        "checking",
        "depository",
      )
    end
  end
end
