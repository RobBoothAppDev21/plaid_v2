# frozen_string_literal: true

module MoneyHelper
  def format_category_money(category_money)
    category_money.map do |category|
      [category[0], remove_currency_symbol(category[1].format)]
    end
  end

  def remove_currency_symbol(amount)
    amount.sub("$", "")
  end
end
