# Transformable

Lets you manipulate data as it's being set on an object without a lot of setter method boilerplate

<img src="https://secure.travis-ci.org/arches/transformable.png" />

## Installation

Add this line to your application's Gemfile:

    gem 'transformable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transformable

## Usage

Use the `clean` method on your objects to create a setter method that manipulates inputs:

```ruby
class User < ActiveRecord::Base
  include Transformable
  clean(:email) {|e| e.downcase}
end

> u = User.new(email: "foo@BAR.com")
> u.email
 => "foo@bar.com"
```

By default, nil values won't be passed through to the block. Use the skip_nil option if you want them:

```ruby
class User < ActiveRecord::Base
  include Transformable
  clean(:email, :skip_nil => false) {|e| e || "example@foobar.com"}
end

> u = User.new(email: "email@email.com")
> u.email = nil
> u.email
 => "example@foobar.com"
```

I use regexes for removing forbidden characters:

```ruby
class User < ActiveRecord::Base
  include Transformable
  clean(:email) {|e| e.gsub(/\s/, "")} # remove spaces
end

> u = User.new(email: "f o o @ b a r . c o m")
> u.email
 => "foo@bar.com"
```

Transformable works on pure ruby objects as well as ActiveRecord objects!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
