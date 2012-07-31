require "transformable/version"

module Transformable

  def self.included(base)
    base.extend ClassMethods
  end


  module ClassMethods
    def clean(attr, options={}, &blk)

      skip_nil = options.fetch(:skip_nil) { true }

      define_method "#{attr}=" do |value|
	if value.nil? and skip_nil
	  new_value = value
	else
	  new_value = yield(value)
	end
	instance_variable_set("@#{attr}", new_value)
        write_attribute(attr, new_value) if defined? ActiveRecord and defined? ActiveRecord::Base and is_a? ActiveRecord::Base
      end
    end
  end
end
