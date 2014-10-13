require 'rails_helper'

RSpec.describe "extensions/show", :type => :view do
  before(:each) do
    @extension = assign(:extension, Extension.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
