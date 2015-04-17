require 'rails_helper'

RSpec.describe "allotments/edit", type: :view do
  before(:each) do
    @allotment = assign(:allotment, Allotment.create!())
  end

  it "renders the edit allotment form" do
    render

    assert_select "form[action=?][method=?]", allotment_path(@allotment), "post" do
    end
  end
end
