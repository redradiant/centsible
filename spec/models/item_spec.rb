require File.expand_path('../../spec_helper.rb', __FILE__)
require_dependency 'amazon_item'

describe Auction do
  include AmazonItem::ObjectHelpers

  before(:all) do
    DatabaseCleaner.clean
    @item = Factory.create(:item)
    @asin = @item.asin
    @item = AmazonItem.load(@asin)
  end

  it "should have Amazon data" do
    @item.to_hash.keys.should include("list_price")
    @item.key(:title).should_not be_blank
  end

  it "should cost $299.99" do
    @item.amount_string.should eql "299.99"
  end

  it "should save" do
    @item.save.should be_true
  end

  it "has picture URLs" do
    @item.image_type_urls(:large).should have(3).items
    @item.image_categories.should include('primary', 'variant') 
  end

  it "should be an XBox" do
    @item.key(:title).should eql("Xbox 360 250GB Console")
    @item.key(:manufacturer).should eql("Microsoft")
  end

  it "should have an image" do
    @item.image_type_urls(:large).first.should eql "http://ecx.images-amazon.com/images/I/31W-rDW73qL.jpg"
  end
end

