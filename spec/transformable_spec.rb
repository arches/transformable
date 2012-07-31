require 'spec_helper'

class Foo
  include Transformable
  attr_accessor :title
  clean(:title) { |v| v.gsub(/\s/, "")}
end

class Bar
  include Transformable
  attr_accessor :title
  clean(:title, :skip_nil => false) {|v| v.nil? ? "bar" : v }
end

class NoNils
  include Transformable
  attr_accessor :title
  clean(:title) {|v| "bar" }
end

describe Transformable do
  it "used the provided block to filter attributes" do
    f = Foo.new
    f.title = "bar bar"
    f.title.should == "barbar"
  end

  context "when :skip_nil is not set (aka :skip_nil => true)" do
    it "doesn't let nil values through to the block" do
      n = NoNils.new
      n.title = nil
      n.title.should be_nil
    end
  end


  context "when :skip_nil is set to false" do
    it "lets nil values through" do
      b = Bar.new
      b.title = nil
      b.title.should == "bar"
    end

    it "lets non-nil values through" do
      b = Bar.new
      b.title = "foobar"
      b.title.should == "foobar"
    end
  end
end
