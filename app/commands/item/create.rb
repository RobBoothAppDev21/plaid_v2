# frozen_string_literal: true

module Item::Create
  def self.call(item_exchange_response, metadata, user:)
    return if existing_item?(extract_bank_name(metadata), user.id)

    Item.create(
      user_id: user.id,
      access_token: extract_access_token(item_exchange_response),
      plaid_item_id: extract_plaid_item_id(item_exchange_response),
      bank_name: extract_bank_name(metadata),
    )
  end

  def self.extract_plaid_item_id(item_exchange_response)
    item_exchange_response["item_id"]
  end

  def self.extract_access_token(item_exchange_response)
    item_exchange_response["access_token"]
  end

  def self.extract_bank_name(metadata)
    metadata["institution"]["name"]
  end

  private

  def self.existing_item?(bank_name, user_id)
    Item.exists?(bank_name: bank_name, user_id: user_id) # create NullItem
  end
end
