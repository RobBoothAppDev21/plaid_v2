# frozen_string_literal: true

module Transaction::GetTopMerchants
  def self.call
    retrieve_merchant_by_spend
  end

  def self.retrieve_merchant_by_spend
    transactions = Transaction.where('authorized_date > ?', 30.days.ago)
    merchant_by_spend = transactions.each_with_object({}) do |transaction, hash|
      hash[transaction.name] ||= 0
      hash[transaction.name] += transaction.amount
    end

    merchant_by_spend.sort_by { |h, v| -v }.slice(0, 5)
  end
end
