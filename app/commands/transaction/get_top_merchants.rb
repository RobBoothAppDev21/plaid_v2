# frozen_string_literal: true

module Transaction::GetTopMerchants
  def self.call
    retrieve_merchant_by_spend
  end

  def self.retrieve_merchant_by_spend
    merchant_by_spend = Transaction.all.each_with_object({}) do |transaction, hash|
      hash[transaction.name] ||= 0
      hash[transaction.name] += transaction.amount_cents
    end

    merchant_by_spend.sort_by { |h, v| -v }.slice(0, 5)
  end
end
