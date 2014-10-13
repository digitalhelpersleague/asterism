require 'rails_helper'

RSpec.describe "extensions/new", :type => :view do
  before(:each) do
    assign(:extension, Extension.new())
  end

  it "renders new extension form" do
    render

    assert_select "form[action=?][method=?]", extensions_path, "post" do
    end
  end
end
