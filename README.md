# ConstructorShortcut

Syntax sugar gem used to generate class-level alias for the constructor.

Before:

```ruby
class CallableClass
  extend Dry::Initializer

  param :foo

  def call
    foo * 2
  end

  class << self
    def call(*args)
      new(*args).call
    end
  end
end
```

After:

```ruby
class CallableClass
  extend Dry::Initializer
  extend ConstructorShortcut[:call]

  param :foo

  def call
    foo * 2
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'constructor_shortcut'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install constructor_shortcut

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gzigzigzeo/constructor_shortcut. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ConstructorShortcut project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/gzigzigzeo/constructor_shortcut/blob/master/CODE_OF_CONDUCT.md).
