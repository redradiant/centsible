class RenameCcTable < ActiveRecord::Migration
    def self.up
    create_table "user_credit_cards", :force => true do |t|
      t.integer  "user_id"
      t.string   "number"
      t.string   "verification_value"
      t.date     "expiration_date"
      t.date     "start_date"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "company"
      t.integer  "location_id"
      t.string   "zip"
      t.string   "phone"
      t.boolean  "security_verified"
      t.boolean  "last_attempt_successful"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    end 
    def self.down
drop_table :user_credit_cards
    end
end
