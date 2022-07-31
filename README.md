# Sipp

A simple wrapper to decode [SIPP/ACRISS](https://www.acriss.org/car-codes/) car codes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sipp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sipp

## Usage

```ruby
code = SIPP::Code.new 'CCMN'
code.to_s # "Compact - 2/4 Door - Manual Unspecified Drive - Unspecified Fuel/Power Without Air"

code.ac? # false
```
If the code is invalid, it will return `nil` on all checks.

Calling `code.validate!` will throw validation errors with exceptions.

## TODO
- add pseudo codes
- add van codes
- add i18n helpers or redo strings into symbols to be i18n-ised
- add query methods for common checks (like `.diesel?` etc)


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/austerlitz/sipp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sipp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/austerlitz/sipp/blob/master/CODE_OF_CONDUCT.md).
