require 'spec_helper'

describe Post do
  before(:each) do
    @post = Factory.create(:post)
  end
  
  it "should create a valid slug path" do
    @post.to_param.should be_a_kind_of(String)
  end
  
end
