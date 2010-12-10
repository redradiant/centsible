require 'spec_helper'

describe "The 'wi' command" do
  describe "on an ActiveRecord class" do
    it "should raise a NoMethodError" do
      lambda { User.wi() }.should raise_exception(NoMethodError)
    end
  end
  describe "on an ActiveRecord object" do
    it "should raise a NoMethodError" do
      lambda { User.find(1).wi() }.should raise_exception(NoMethodError)
    end
  end
  describe "on an array of ActiveRecord object" do
    before(:each) do
      @users = User.all.map{|u| u}
    end
    it "should not raise an exception" do
      lambda { @users.wi }.should_not raise_exception
    end
  end
  describe "on an Association collection" do
    before(:each) do
      @users = User.all
    end
    it "should not raise an exception" do
      lambda { @users.wi }.should_not raise_exception
    end
  end
end



describe "The 'wi' command" do
  describe "containing a string with an expression for evaluation" do
    describe "to test an attrbiute of the preceding object type" do
      it "should return only the preceding objects passing test" do
        Boss.create(6, :blogs) do |blogs|
          users = blogs.where(1,2).have(2, :users)

        end
        special_users =
          Boss.create(:users).with_usernames('jon', 'joe', 'pete'
        ).
          :username=>['jon', 'joe', 'pete']
        ).with_every(:password=>'password').with_only
        do

        end


        Boss.create(3, :users, :username=>['jon', 'joe', 'pete']) do
          where(:users, 1..2).are_friends_with(:user, 3)
          where(:user, 3).is_friends_with(:users, 1..2)
          Boss.create(6, :blogs) do
            where(:blogs, 1..2).belong_to(:user, 1)
            where(:blog, 3).belongs_to(:user, 2)
            where(:user, 2).has(:blog, 3)
            where(:user, 3).has(:blogs, 4..6)
            Boss.create(6, :comments) do
              where(:comments).belong_to(:users, 1..3)
              where(:comments).belongs_to(:blog, :where=>'blog.user != comment.user')
            end
          end
        end

        Blog.create(6) do |blogs|
          blogs.with(1,2).having(2, :users)
        end

        Blog.all.wi("user.first_name == 'John'").each do |blog|
          blog.user.first_name.should == 'John'
        end
        Blog.all.wi("user.last_name =~ /^Pa/").user.name.should =~ [/Patrick/, /Partrich/]
        Blog.all.user.wi("last_name =~ /^Pa/").user.last_name.should include(/Patrick/, /Partrich/)
      end
    end
    describe "testing a method of the preceding object type" do
      it "should return only the objects passing the test" do

      end
    end
  end
  describe "containing a set of strings" do

  end
  describe "containing an integer" do

  end
  describe "containing a set of integers" do

  end
  describe "containing a range" do

  end
  describe "contianing a set of ranges" do

  end

end

describe "The 'with' command containing a hash" do
  describe ""
end


