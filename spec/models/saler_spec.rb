require 'rails_helper'

RSpec.describe Saler, type: :model do
  it "orders by name" do
    andy = Saler.create!(name: "Andy", email: "andy@aaa.com", password: "aaaaaaaaa")
    david = Saler.create!(name: "David", email: "david@aaa.com", password: "aaaaaaaaa")

    expect(Saler.ordered_by_name).to eq([andy, david])
  end
end
