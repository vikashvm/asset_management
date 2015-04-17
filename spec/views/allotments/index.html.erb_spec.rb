require 'rails_helper'

RSpec.describe "allotments/index", type: :view do
  before(:each) do
    assign(:allotments, [
      Allotment.create!(),
      Allotment.create!()
    ])
  end

  it "renders a list of allotments" do
    render
  end
end
