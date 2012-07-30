require 'spec_helper'

class Foo
  include Transformable
  attr_accessor :title
  clean(:title) { |v| v.gsub(/\s/, "")}
end

describe Transformable do
  it "used the provided block to filter attributes" do
    f = Foo.new
    f.title = "bar bar"
    f.title.should == "barbar"
  end
end
