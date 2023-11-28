require 'rails_helper'

RSpec.describe Item, type: :model do

  it "is valid item" do
    item = create(:item)

    expect(item.user.email).to eq("user-1@gmail.com")

    # expect { item }.to change { Item.count }.by(1)
  end
end
