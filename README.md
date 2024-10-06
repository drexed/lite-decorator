# Lite::Decorator

[![Gem Version](https://badge.fury.io/rb/lite-decorator.svg)](http://badge.fury.io/rb/lite-decorator)
[![Build Status](https://travis-ci.org/drexed/lite-decorator.svg?branch=master)](https://travis-ci.org/drexed/lite-decorator)

Lite::Decorator is a library for using the decorator pattern to separate view/presentation
logic from classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-decorator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-decorator

## Table of Contents

* [Setup](#setup)
* [Usage](#usage)
* [Generator](#generator)

## Setup

Defining a decorator is as simple as inheriting from the base class and adding your logic.

```ruby
class UserDecorator < Lite::Decorator::Base

  def full_name
    first_name + ' ' + last_name
  end

end
```

## Usage

To access the decorator you need to pass the object to the decorator class.
PORO's and ActiveRecord objects can be decorated with this method.

### Instance
```ruby
user = User.first
decorator = UserDecorator.new(user)
decorator.full_name #=> "John Doe"
```

### Collection
```ruby
users = User.all
collection = UserDecorator.new(users)
collection.map(&:full_name) #=> ["John Doe", "Jane Poe"]
```

### Infered decoration

Including the `Inference` module will setup a `decorator_class` and `decorator` method
that you can access via your PORO and ActiveRecord objects.

```ruby
class User
  include Lite::Decorator::Inference
end

user = User.first
user.decorator.full_name
```

### Decorator delegation

Including the `Delegator` module will use method missing to delegate decorator methods as
if it lived on the PORO or ActiveRecord object itself. If neither the class instance and the
decorator contain the method, a `NoMethodError` just like normal.

```ruby
class User < ActiveRecord::Base
  include Lite::Decorator::Delegator
end

user = User.first
user.full_name
```

## Generator

Use `rails g decorator NAME` will generate the following files:

```erb
app/decorators/[NAME]_decorator.rb
```

If an `ApplicationDecorator` file in the `app/decorators` directory is available, the
generator will create file that inherit from `ApplicationDecorator` if not it will
fallback to `Lite::Decorator::Base`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drexed/lite-decorator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Decorator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/drexed/lite-decorator/blob/master/CODE_OF_CONDUCT.md).
