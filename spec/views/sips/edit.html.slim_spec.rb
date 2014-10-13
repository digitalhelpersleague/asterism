require 'rails_helper'

RSpec.describe "sips/edit", :type => :view do
  before(:each) do
    @sip = assign(:sip, Sip.create!())
  end

  it "renders the edit sip form" do
    render

    assert_select "form[action=?][method=?]", sip_path(@sip), "post" do
    end
  end
end
