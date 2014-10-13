require 'rails_helper'

RSpec.describe "extensions/index", :type => :view do
  before(:each) do
    assign(:extensions, [
      Extension.create!(),
      Extension.create!()
    ])
  end

  it "renders a list of extensions" do
    render
  end
end
