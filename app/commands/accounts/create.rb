# frozen_string_literal: true

module account::Create
  def self.call(name, user:)
    account_name = "#{user.email}_account"
    account.create(name: account_name, user_id: user.id)
  end
end
