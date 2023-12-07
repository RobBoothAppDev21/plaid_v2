# frozen_string_literal: true

module PlaidApi::Configure
  def self.call
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment["sandbox"]
    configuration.api_key["PLAID-CLIENT-ID"] = Rails.application.credentials.plaid[:client_id]
    configuration.api_key["PLAID-SECRET"] = Rails.application.credentials.plaid[:sandbox][:secret]
    configuration
  end
end