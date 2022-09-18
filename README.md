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

code.category.to_s # Compact
code.type.to_s # 2/4 Door
code.transmission_drive.to_s # Manual Unspecified Drive
code.transmission.to_s # Manual
code.drive.to_s # Unspecified Drive
code.transmission_manual? # true
code.transmission_auto? # false
code.fuel_ac.to_s # Unspecified Fuel/Power Without Air
code.fuel.to_s # Unspecified Fuel/Power
code.ac.to_s # No Air
code.ac? # false
```
If the code is invalid, it will return `nil` on all checks.

If only some of the letters are valid, it will translate them:
```ruby
code = SIPP::Code.new '**DR'
code.valid? # false
code.to_s # #N/A - #N/A - Auto AWD - Unspecified Fuel/Power With Air
```

Calling `code.validate!` will throw validation errors with exceptions.

### #as_json
A convenient hash that lists car capabilities.
```ruby
 SIPP::Code.new('CCDD').as_json
{
      category: :compact,
          type: :two_four_door,
  transmission: :auto,
         drive: :awd,
          fuel: :diesel,
            ac: :air,
          code: "CCDD"
}

```

## I18n

**NOTE**: a simpler version without i18n is kept in `v.1.4`, you can use it as `gem 'sipp', git: 'https://github.com/austerlitz/sipp.git', tag: 'v1.4'`

For more flexibility methods like `category`, `drive` etc. return a simple 
Wrapper object to provide either symbol or an i18n-sed string. 
Thus, when `#to_s` is implied, it will return a translated message. 
For use in code or elsewhere, use `#to_sym`:
```ruby
if :diesel == code.fuel.to_sym
  puts 'This car has a diesel engine'
end
```

_This seems to be not an elegant solution. If you have any ideas on improving it, please make a pull request._


You can override existing or add your own translations an put them under the 
`sipp` scope:
```yaml
ua:
  sipp:
    category:
      mini: міні
    type:
      convertible: кабріолет
    transmission:
      manual: МКПП
      auto: АКПП      
```
## Inverted
_A very early beta. But beta than nothin'_

It's also able to generate a SIPP code from car capabilities. 
The capabilities are expected in the same format as produced by `#as_json`.
If something invalid is supplied it generates `'*'`.

```ruby
SIPP::Inverted.generate({ category: :compact, type: :two_four_door, transmission: :manual, drive: :unspecified, fuel: :petrol, ac: :air})
# => 'CCMV'
SIPP::Inverted.generate({ category: :compact, type: :two_four_door, fuel: :petrol, ac: :air })
# => 'CC*V'
```


## TODO
- [x] add i18n helpers or redo strings into symbols to be i18n-sed
- [x] add SIPP code generation from car capabilities
  - [ ] add input validation of some kind?
- [ ] add Extended SIPP codes
- [ ] add query methods for common checks (like `.diesel?` etc)
- [ ] add pseudo codes
- [ ] add van codes


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/austerlitz/sipp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sipp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/austerlitz/sipp/blob/master/CODE_OF_CONDUCT.md).
