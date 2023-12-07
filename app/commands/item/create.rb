# frozen_string_literal: true

module Item::Create
  def self.call(item_exchange_response:, metadata:, user_id:)
    # return if existing_item?(item_exchange_response, metadata, user_id)
    return if update_item?(item_exchange_response:, metadata:, user_id:)

    Item.create(
      user_id:,
      access_token: extract_access_token(item_exchange_response),
      plaid_item_id: extract_plaid_item_id(item_exchange_response),
      bank_name: extract_bank_name(metadata),
      institution_id: extract_institution_id(metadata),
      is_active: true,
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

  def self.extract_institution_id(metadata)
    metadata["institution"]["institution_id"]
  end

  def self.existing_item?(metadata, user_id)
    institution_id = extract_institution_id(metadata)
    return false if Item.where(institution_id:, user_id:).exists?

    # return false unless Item.exists?(bank_name:, user_id:)

    # Item::UpdateIem.call(item)
    # if Item.exists?(bank_name:, user_id:)
    #   item = Item.find_by(bank_name:, user_id:)
    #   Item::UpdateItem.call(item)
    # end
  end

  def self.update_item?(item_exchange_response:, metadata:, user_id:)
    institution_id = extract_institution_id(metadata)

    if Item.where(institution_id:, user_id:).exists?
      item = Item.find_by(institution_id:, user_id:)
      access_token = extract_access_token(item_exchange_response)
      Item::UpdateAccessToken.call(access_token:, item:)
      true
    else
      false
    end
  end
end
