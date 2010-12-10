require 'spec_helper'

describe "items/edit.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => item_path(@item), :method => "post" do
    end
  end
end
