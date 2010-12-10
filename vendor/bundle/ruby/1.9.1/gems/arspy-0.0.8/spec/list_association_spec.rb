require 'spec_helper'

describe "The 'la' command" do
  user_association_names = %w(friendships friends blogs comments)
  describe "for an ActiveRecord class" do
    it "should not raise an exception" do
      lambda { User.la :data }.should_not raise_exception
    end
    it "should return list of association" do
      User.la(:data).map{|d| d.first }.should =~ user_association_names
    end
  end
  describe "for an ActiveRecord object" do
    it "should not raise an exception" do
      lambda { User.find(1).la :data }.should_not raise_exception
    end
    it "should return association names" do
      User.find(1).la(:data).map{|d| d.first}.should =~ user_association_names
    end
  end
  describe "for an array of ActiveRecord objects" do
    it "should not raise an exception" do
      lambda {
        User.all.map{|u| u}.la(:data)
      }.should_not raise_exception
    end
    it "should return all associations" do
      User.all.map{|u| u}.la(:data).map{|d| d.first}.should =~ user_association_names
    end
  end
  describe "for association collection" do
    it "should not raise an exception" do
      lambda { User.all.la :data }.should_not raise_exception
    end
    it "should return all associations" do
      User.all.la(:data).map{|d| d.first}.should =~ user_association_names
    end
  end
end

describe "The list_association operation" do
  user_association_class_names = %w((Friendship) (User) (Blog) (Comment))
  blog_association_class_names = %w((User) (*) (Comment))
  comment_association_class_names = %w((User) (Blog))
  friendship_association_class_names = %w((User) (User))
  user_association_types = %w(has_many has_many has_many has_many)
  blog_association_types = %w(belongs_to belongs_to has_many)
  comment_association_types = %w(belongs_to belongs_to)
  friendship_association_types = %w(belongs_to belongs_to)
  it "should return the correct class names for associations" do
    User.la(:data).map{|d| d[2] }.should =~ user_association_class_names
    Blog.la(:data).map{|d| d[2] }.should =~ blog_association_class_names
    Comment.la(:data).map{|d| d[2]}.should =~ comment_association_class_names
    Friendship.la(:data).map{|d| d[2]}.should =~ friendship_association_class_names
  end
  it "should return the correct assocation types" do
    User.la(:data).map{|d| d[1] }.should =~ user_association_types
    Blog.la(:data).map{|d| d[1] }.should =~ blog_association_types
    Comment.la(:data).map{|d| d[1]}.should =~ comment_association_types
    Friendship.la(:data).map{|d| d[1]}.should =~ friendship_association_types
  end
end
