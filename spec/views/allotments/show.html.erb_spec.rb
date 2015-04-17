require 'rails_helper'

RSpec.describe "allotments/show", type: :view do
  before(:each) do
    @allotment = assign(:allotment, Allotment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
