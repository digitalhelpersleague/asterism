require 'rails_helper'

RSpec.describe "sips/new", :type => :view do
  before(:each) do
    assign(:sip, Sip.new())
  end

  it "renders new sip form" do
    render

    assert_select "form[action=?][method=?]", sips_path, "post" do
    end
  end
end
