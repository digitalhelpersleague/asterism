require 'rails_helper'

RSpec.describe "Routers", :type => :request do
  describe "GET /routers" do
    it "works! (now write some real specs)" do
      get routers_path
      expect(response).to have_http_status(200)
    end
  end
end
