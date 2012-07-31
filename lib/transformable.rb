require "transformable/version"

module Transformable

  def self.included(base)
    base.extend ClassMethods
  end


  module ClassMethods
    def clean(attr, &blk)

      define_method "#{attr}=" do |value|
	new_value = yield(value)
	instance_variable_set("@#{attr}", new_value)
        write_attribute(attr, new_value) if defined? ActiveRecord and defined? ActiveRecord::Base and is_a? ActiveRecord::Base
      end
    end
  end
end
