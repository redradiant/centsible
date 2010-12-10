class ImportOthers < ActiveRecord::Migration
  def self.up

    create_table "amazon_items", :force => true do |t|
      t.string   "asin"
      t.string   "name"
      t.string   "image_url"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "auctions", :force => true do |t|
      t.integer  "item_id"
      t.integer  "pool_id"
      t.datetime "start_time"
      t.integer  "end_interval"
      t.integer  "timezone"
      t.boolean  "require_pool_membership"
      t.string   "auction_type"
      t.string   "status"
      t.integer  "winning_bid_id"
      t.string   "parent_type"
      t.integer  "parent_id"
      t.integer  "children_count",          :default => 0
      t.integer  "level_cache",             :default => 0
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "bids", :force => true do |t|
      t.integer  "user_id"
      t.integer  "auction_id"
      t.datetime "effective_at"
      t.decimal  "amount",          :precision => 8, :scale => 2
      t.integer  "bidcount"
      t.string   "bid_type"
      t.string   "engine_name"
      t.string   "engine_settings"
      t.string   "parent_type"
      t.integer  "parent_id"
      t.integer  "children_count",                                :default => 0
      t.integer  "level_cache",                                   :default => 0
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
  
    create_table "histories", :force => true do |t|
      t.string   "message"
      t.string   "username"
      t.integer  "item"
      t.string   "table"
      t.integer  "month",      :limit => 2
      t.integer  "year",       :limit => 8
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    add_index "histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"
  
    create_table "locations", :force => true do |t|
      t.string  "name"
      t.string  "street"
      t.string  "street2"
      t.string  "city"
      t.string  "state"
      t.string  "country"
      t.string  "postal_code", :limit => 16
      t.decimal "lat",                       :precision => 15, :scale => 10
      t.decimal "lng",                       :precision => 15, :scale => 10
    end
  
    add_index "locations", ["lat", "lng"], :name => "lat_lng_index"
  
    create_table "pictures", :force => true do |t|
      t.string   "target_type"
      t.integer  "target_id"
      t.string   "picture_url"
      t.string   "caption"
      t.integer  "order"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
    end
  
    create_table "pools", :force => true do |t|
      t.string   "name"
      t.string   "type"
      t.string   "scoped_to_attributes"
      t.text     "scoped_to_block"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "user_locations", :force => true do |t|
      t.integer  "user_id"
      t.integer  "location_id"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "user_tokens", :force => true do |t|
      t.integer  "user_id"
      t.string   "provider"
      t.string   "uid"
      t.string   "token"
      t.string   "secret"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

  end

  def self.down

  end
end
