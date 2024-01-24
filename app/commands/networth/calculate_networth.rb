# frozen_string_literal: true

module Networth::CalculateNetworth
  def self.call
    Assets::GetAccounts.total_asset_value - Liabilities::GetAccounts.total_liabilities_value
  end
end
