require "transformable/version"

module Transformable

  def self.included(base)
    base.extend ClassMethods
  end


  module ClassMethods
    def clean(attr, &blk)

      define_method "#{attr}=" do |value|
	new_value = yield(value)
	puts new_value
	instance_variable_set("@#{attr}", new_value)
	begin
	  write_attribute(attr, new_value)
	rescue NoMethodError
	end
      end
    end
  end
end
