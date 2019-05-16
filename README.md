# Smart Logs

## Dependencies
This script was written using Ruby 2.6.2. Bundler is also needed.

## Setup
`bundle install`

## Usage
`bin/smart_logs data/webserver.log`

The script takes an argument with a path to a log file structured as follows:
```
path1 ip_address1
path2 ip_address2
...
```

## Testing
`bundle exec rspec`
