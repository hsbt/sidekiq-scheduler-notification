# Sidekiq::Scheduler::Notification

Simple notification middleware with slack when invoke/error/finish to sidekiq jobs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-scheduler-notification'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-scheduler-notification

## Usage

Added following configuration to initializer like `config/initializer/sidekiq.rb`

```rb
Sidekiq::Scheduler.notify_webhook = "https://hooks.slack.com/services/xxx/yyyzzz"
```

and append `notification` variable like this

```yaml
NotificationJob:
  cron: "15 * * * *"
  notification: true
```

You can get notification from sidekiq to slack channnel.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hsbt/sidekiq-scheduler-notification.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
