require 'rails_helper'

RSpec.describe "Sips", :type => :request do
  describe "GET /sips" do
    it "works! (now write some real specs)" do
      get sips_path
      expect(response).to have_http_status(200)
    end
  end
end
