# Date Calculator API - Ruby Gem

Date Calculator computes the difference between two calendar dates in minutes, hours, days, weeks, months, and years. Supply start and end dates in YYYY-MM-DD format to receive exact interval breakdowns.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_datecalculator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_datecalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_datecalculator'

# Initialize the client
client = APIVerve::Datecalculator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  start: "2022-01-01",
  end: "2024-08-31"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ start: "2022-01-01", end: "2024-08-31" })
  puts response["data"]
rescue APIVerve::Datecalculator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Datecalculator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Datecalculator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "minutes": 524160,
    "hours": 8736,
    "days": 364,
    "weeks": 52,
    "months": 11,
    "years": 0,
    "start": {
      "date": "2022-01-01",
      "day": "Saturday",
      "month": "January",
      "year": "2022",
      "words": "Saturday, January 1st 2022"
    },
    "end": {
      "date": "2022-12-31",
      "day": "Saturday",
      "month": "December",
      "year": "2022",
      "words": "Saturday, December 31st 2022"
    }
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/datecalculator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/datecalculator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/datecalculator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
