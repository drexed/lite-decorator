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

## Setup

`rails g lite:decorator:install` will generate the following file:
`../app/decorators/application_decorator.rb`

```ruby
class ApplicationDecorator < Lite::Decorator::Base
end
```

Use `rails g decorator NAME` will generate the following file:
`../app/decorators/[name]_decorator.rb`

You will then need to fill this class with the methods you want to decorate:

```ruby
class UserDecorator < ApplicationDecorator

  def full_name
    first_name + ' ' + last_name
  end

end
```

## Usage

To access the decorator you need to pass the object to the decorator class and thats it.
You can even decorate a collection of objects by passing the collection to `decorate`.

```ruby
user = User.first # || User.all

decorator = UserDecorator.new(user)

# - or -

decorator = UserDecorator.decorate(user)

decorator.full_name #=> "John Doe"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-decorator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Decorator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-decorator/blob/master/CODE_OF_CONDUCT.md).
