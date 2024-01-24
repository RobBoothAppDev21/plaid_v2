# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  has_many :accounts, dependent: :destroy

  validates :access_token, :plaid_item_id, :bank_name, :is_active,
            :institution_id, presence: true
end
