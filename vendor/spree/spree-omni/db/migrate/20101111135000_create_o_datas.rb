class CreateODatas < ActiveRecord::Migration
  def self.up
    create_table :o_datas do |t|
      t.string :provider, :nil => false
      t.integer :uid, :nil => false
      t.text :user_info
      t.string :name
      t.integer :user_id, :nil => false
      t.timestamps
    end
    add_index :o_datas, [:uid,:provider], :unique => true
    add_index :o_datas, :user_id
  end

  def self.down
    drop_table :o_datas
  end
end
