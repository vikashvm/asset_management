require 'rails_helper'

RSpec.describe "Allotments", type: :request do
  describe "GET /allotments" do
    it "works! (now write some real specs)" do
      get allotments_path
      expect(response).to have_http_status(200)
    end
  end
end
