require 'rails_helper'

RSpec.describe "allotments/new", type: :view do
  before(:each) do
    assign(:allotment, Allotment.new())
  end

  it "renders new allotment form" do
    render

    assert_select "form[action=?][method=?]", allotments_path, "post" do
    end
  end
end
