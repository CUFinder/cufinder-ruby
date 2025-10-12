# CUFinder Ruby SDK

Official Ruby SDK for accessing CUFinder's comprehensive business intelligence and lead generation services.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cufinder-ruby'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install cufinder-ruby
```

## Usage

### Basic Setup

```ruby
require 'cufinder_ruby'

# Initialize the SDK with your API key
sdk = CufinderRuby::SDK.new(api_key: 'your-api-key-here')
```

### Available Services

The SDK provides access to all CUFinder API services:

#### 1. CUF - Company URL Finder
```ruby
result = sdk.cuf(company_name: "Apple Inc", country_code: "US")
puts result.domain  # => "apple.com"
```

#### 2. LCUF - LinkedIn Company URL Finder
```ruby
result = sdk.lcuf(company_name: "Apple Inc")
puts result.linkedin_url  # => "linkedin.com/company/apple"
```

#### 3. DTC - Domain to Company
```ruby
result = sdk.dtc(company_website: "apple.com")
puts result.company_name  # => "Apple Inc"
```

#### 4. DTE - Domain to Emails
```ruby
result = sdk.dte(company_website: "apple.com")
puts result.emails  # => ["contact@apple.com", "info@apple.com"]
```

#### 5. NTP - Name to Phones
```ruby
result = sdk.ntp(company_name: "Apple Inc")
puts result.phones  # => ["+1-408-996-1010"]
```

#### 6. REL - Reverse Email Lookup
```ruby
result = sdk.rel(email: "tim.cook@apple.com")
puts result.person.full_name  # => "Tim Cook"
```

#### 7. FCL - Find Company Lookalikes
```ruby
result = sdk.fcl(query: "tech startup")
puts result.companies.length  # => 10
```

#### 8. ELF - Enrich LinkedIn Fundraising
```ruby
result = sdk.elf(query: "tech company")
puts result.fundraising.funding_money_raised  # => "$5M"
```

#### 9. CAR - Company Annual Revenue
```ruby
result = sdk.car(query: "Apple Inc")
puts result.revenue  # => "$394.3B"
```

#### 10. FCC - Find Company Children
```ruby
result = sdk.fcc(query: "Apple Inc")
puts result.subsidiaries  # => ["Beats Electronics", "Shazam"]
```

#### 11. FTS - Find Tech Stack
```ruby
result = sdk.fts(query: "web development")
puts result.technologies  # => ["React", "Node.js", "Python"]
```

#### 12. EPP - Enrich Person Profile
```ruby
result = sdk.epp(linkedin_url: "linkedin.com/in/tim-cook")
puts result.person.full_name  # => "Tim Cook"
```

#### 13. FWE - Find Work Email
```ruby
result = sdk.fwe(linkedin_url: "linkedin.com/in/tim-cook")
puts result.email  # => "tim.cook@apple.com"
```

#### 14. TEP - Title Email Phone
```ruby
result = sdk.tep(full_name: "Tim Cook", company: "Apple Inc")
puts result.person.email  # => "tim.cook@apple.com"
puts result.person.phone  # => "+1-408-996-1010"
```

#### 15. ENC - Enrich Company
```ruby
result = sdk.enc(query: "Apple Inc")
puts result.company.employee_count  # => 164000
```

#### 16. CEC - Company Employee Count
```ruby
result = sdk.cec(query: "Apple Inc")
puts result.countries  # => {"US" => 100000, "CA" => 5000}
```

#### 17. CLO - Company Locations
```ruby
result = sdk.clo(query: "Apple Inc")
puts result.locations.first.city  # => "Cupertino"
```

#### 18. CSE - Company Search Engine
```ruby
result = sdk.cse(name: "tech", country: "US", industry: "software")
puts result.companies.length  # => 50
```

#### 19. PSE - Person Search Engine
```ruby
result = sdk.pse(full_name: "John", country: "US", company_name: "Apple")
puts result.peoples.length  # => 25
```

#### 20. LBS - Local Business Search
```ruby
result = sdk.lbs(name: "restaurant", city: "New York")
puts result.companies.length  # => 100
```

### Error Handling

The SDK provides comprehensive error handling:

```ruby
begin
  result = sdk.cuf(company_name: "Apple Inc", country_code: "US")
rescue CufinderRuby::AuthenticationError => e
  puts "Authentication failed: #{e.message}"
rescue CufinderRuby::RateLimitError => e
  puts "Rate limit exceeded: #{e.message}"
rescue CufinderRuby::CreditLimitError => e
  puts "Credit limit exceeded: #{e.message}"
rescue CufinderRuby::ApiError => e
  puts "API error #{e.status}: #{e.message}"
rescue CufinderRuby::ValidationError => e
  puts "Validation error: #{e.message}"
end
```

### Configuration

You can configure the SDK with custom settings:

```ruby
sdk = CufinderRuby::SDK.new(
  api_key: 'your-api-key',
  base_url: 'https://api.cufinder.io/v2',  # Default
  timeout: 30,                              # Default
  max_retries: 3                           # Default
)
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cufinder/cufinder-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
