require 'rails_helper'

RSpec.describe "sips/index", :type => :view do
  before(:each) do
    assign(:sips, [
      Sip.create!(),
      Sip.create!()
    ])
  end

  it "renders a list of sips" do
    render
  end
end
