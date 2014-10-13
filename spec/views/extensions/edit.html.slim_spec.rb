require 'rails_helper'

RSpec.describe "extensions/edit", :type => :view do
  before(:each) do
    @extension = assign(:extension, Extension.create!())
  end

  it "renders the edit extension form" do
    render

    assert_select "form[action=?][method=?]", extension_path(@extension), "post" do
    end
  end
end
