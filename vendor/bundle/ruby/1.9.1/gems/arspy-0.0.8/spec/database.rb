require 'rubygems'

gem 'sqlite3-ruby', '>= 1.2.5'
gem 'activerecord', ENV['AR_VERSION'] ? "=#{ENV['AR_VERSION']}" : '>=2.3.2'
require 'sqlite3'
require 'active_record'
require 'factory_girl'

ActiveRecord::Base.establish_connection({'adapter' => 'sqlite3', 'database' => ':memory:'})
ActiveRecord::Base.logger = Logger.new("#{File.dirname(__FILE__)}/active_record.log")
cx = ActiveRecord::Base.connection

cx.create_table(:users, :force=>true) do |t|
  t.string :first_name
  t.string :last_name
  t.integer :age
  t.boolean :active
end
class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through=>:friendships
  has_many :blogs
  has_many :comments
  
  def name; "#{first_name} #{last_name}"; end
end

cx.create_table(:friendships, :force=>true) do |t|
  t.references :user
  t.references :friend
  t.integer :years_known
end
class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name=>'User'
end

fnames = ['John', 'Ted', 'Jan', 'Beth', 'Mark', 'Mary']
lnames = ['Patrick', 'Hanson', 'Partrich', 'Meyers', 'Dougherty', 'Smith']
Factory.define(:user) do |f|
  f.sequence(:first_name) {|n| fnames[n-1]}
  f.sequence(:last_name) {|n| lnames[n-1]}
  f.sequence(:age){|n| 20 + (n-1) }
  f.sequence(:active){|n| (n-1).odd? }
end

users=Hash[*fnames.map{|fn| [fn.downcase.to_sym, Factory(:user)]}.flatten]

friends = {
  :john => [:beth, :mark],
  :ted => [:jan, :beth, :john],
  :jan => [:ted, :john, :jan, :beth, :mark],
  :beth => [:john],
  :mark => [:john, :jan]
}
friends.each do |user, friends_list|
  friends_list.each do |friend|
    users[user].friends << users[friend]
  end
end

cx.create_table(:images, :force=>true) do |t|
  t.string :caption
  t.integer :size
end
class Image < ActiveRecord::Base
  has_many :blog, :as=>:asset
end

cx.create_table(:recordings, :force=>true) do |t|
  t.string :title
  t.integer :duration
end
class Recording < ActiveRecord::Base
  has_many :blog, :as=>:asset
end

images = ['dogs', 'cats', 'rabbits'].inject([]) do |array, name|
  array << Image.create(:caption=>name, :size=>((array.size+1)*1024))
end
recordings = ['kittens', 'puppies', 'parrots'].inject([]) do |array, name|
  array << Recording.create(:title=>name, :duration=>(10*(array.size+1)))
end

cx.create_table(:blogs, :force=>true) do |t|
  t.references :user
  t.string :title
  t.datetime :published_at
  t.references :asset, :polymorphic=>true, :null=>true
end
class Blog < ActiveRecord::Base
  belongs_to :user
  belongs_to :asset, :polymorphic=>true
  has_many :comments
end
dates = [2.months.ago, 4.months.ago, 6.months.ago, 8.months.ago]
Factory.define(:blog) do |f|
  f.sequence(:title){|n| "blog_title_#{n}"}
  f.sequence(:asset_id){|n| (n-1).odd? ? images[((n-1)/2)%images.size] : recordings[((n-1)/2)%recordings.size]}
  f.sequence(:asset_type){|n| (n-1).odd? ? 'Image' : 'Recording'}
  f.sequence(:published_at){|n| dates[(n-1)%dates.size]}
end

cx.create_table(:comments, :force=>true) do |t|
  t.references :user
  t.references :blog
  t.string :comment
end
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
end

comments = ['I agree', 'I disagree', 'I like it.', 'I do not like it at all.']
user_array = users.values.sort{|a,b| a.last_name <=> b.last_name}
user_array.each_with_index do |user, index|
  0..(index%(users.size/2)).times do
    blog = Factory.build(:blog)
    blog.user = user
    blog.save!

    start_index = user_array.index(user)
    commenters = user_array.reject{|u| u == user}
    start_index = start_index >= commenters.size ? 0 : start_index
    0..(index%(users.size)).times do |t|
      comment = Comment.new(:comment=>comments[index%comments.size])
      comment.user = commenters[(start_index + t)%commenters.size]
      comment.blog = blog
      comment.save!
    end
  end
end

