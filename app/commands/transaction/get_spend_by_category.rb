# frozen_string_literal: true

module Transaction::GetSpendByCategory
  def self.call
    retrieve_spend_by_category
  end

  def self.retrieve_spend_by_category
    transactions = Transaction.where('authorized_date > ?', 30.days.ago)
    spend_by_spend_category = transactions.all.each_with_object({}) do |transaction, hash|
      hash[transaction.category_primary] ||= 0
      hash[transaction.category_primary] += transaction.amount_cents
    end

    spend_by_spend_category.sort_by { |h, v| -v }
  end
end
