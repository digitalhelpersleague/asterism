require 'rails_helper'

RSpec.describe "sips/show", :type => :view do
  before(:each) do
    @sip = assign(:sip, Sip.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
