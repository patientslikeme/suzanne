# Suzanne

[Figaro](http://www.github.com/laserlemon/figaro) enables simple Rails app configuration using `ENV` and a single YAML file.

[Suzanne](http://www.github.com/patientslikeme/suzanne) extracts some of the configuration functionality from Figaro, removing the Rails dependency so it can be used in any Ruby app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'suzanne'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install suzanne
```

## Usage

Given the following configuration file:

```yaml
# config/application.yml

LOG_LEVEL: debug
LOG_SQL: false
SANITIZE_DATA: true
THREADS: 3
```

You can access the configuration settings in your app:

```ruby
Suzanne.configure(File.expand_path("config/application.yml", __dir__))

ENV['LOG_LEVEL']            # => "debug"
Suzanne.env.LOG_LEVEL       # => "debug"
Suzanne.env.log_level       # => "debug"

Suzanne.env.log_sql?        # => false
Suzanne.env.sanitize_data?  # => true  ("t", "true", and "1" all represent true)

Suzanne.env.threads         # => "3"  (all values are converted to strings)
```

Environment variables take precedence over the configuration file:

```bash
export LOG_LEVEL=error
```

```ruby
Suzanne.configure(File.expand_path("config/application.yml", __dir__))
Suzanne.env.log_level       # => "error"
```

## Contributing

1. Fork it ( http://github.com/patientslikeme/suzanne/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request
