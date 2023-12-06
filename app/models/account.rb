# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :item
  # has_many :transactions, -> { order("authorized_date desc") }, dependent: :destroy
  has_many :transactions, dependent: :destroy
end
