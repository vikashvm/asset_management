require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(),
      Purchase.create!()
    ])
  end

  it "renders a list of purchases" do
    render
  end
end
