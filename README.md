# CUFinder Ruby Client

Official Ruby Client for accessing CUFinder's comprehensive business intelligence and lead generation services.

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

# Initialize the client with your API key
client = Cufinder::Client.new(api_key: 'your-api-key-here')
```

### Available Services

The Client provides access to all CUFinder API services:

#### 1. CUF - Company URL Finder
```ruby
result = client.cuf(company_name: "Apple Inc", country_code: "US")
puts result.domain  # => "apple.com"
```

#### 2. LCUF - LinkedIn Company URL Finder
```ruby
result = client.lcuf(company_name: "Apple Inc")
puts result.linkedin_url  # => "linkedin.com/company/apple"
```

#### 3. DTC - Domain to Company
```ruby
result = client.dtc(company_website: "apple.com")
puts result.company_name  # => "Apple Inc"
```

#### 4. DTE - Domain to Emails
```ruby
result = client.dte(company_website: "apple.com")
puts result.emails  # => ["contact@apple.com", "info@apple.com"]
```

#### 5. NTP - Name to Phones
```ruby
result = client.ntp(company_name: "Apple Inc")
puts result.phones  # => ["+1-408-996-1010"]
```

#### 6. REL - Reverse Email Lookup
```ruby
result = client.rel(email: "tim.cook@apple.com")
puts result.person.full_name  # => "Tim Cook"
```

#### 7. FCL - Find Company Lookalikes
```ruby
result = client.fcl(query: "tech startup")
puts result.companies.length  # => 10
```

#### 8. ELF - Enrich LinkedIn Fundraising
```ruby
result = client.elf(query: "tech company")
puts result.fundraising.funding_money_raised  # => "$5M"
```

#### 9. CAR - Company Annual Revenue
```ruby
result = client.car(query: "Apple Inc")
puts result.revenue  # => "$394.3B"
```

#### 10. FCC - Find Company Children
```ruby
result = client.fcc(query: "Apple Inc")
puts result.subsidiaries  # => ["Beats Electronics", "Shazam"]
```

#### 11. FTS - Find Tech Stack
```ruby
result = client.fts(query: "web development")
puts result.technologies  # => ["React", "Node.js", "Python"]
```

#### 12. EPP - Enrich Person Profile
```ruby
result = client.epp(linkedin_url: "linkedin.com/in/tim-cook")
puts result.person.full_name  # => "Tim Cook"
```

#### 13. FWE - Find Work Email
```ruby
result = client.fwe(linkedin_url: "linkedin.com/in/tim-cook")
puts result.email  # => "tim.cook@apple.com"
```

#### 14. TEP - Title Email Phone
```ruby
result = client.tep(full_name: "Tim Cook", company: "Apple Inc")
puts result.person.email  # => "tim.cook@apple.com"
puts result.person.phone  # => "+1-408-996-1010"
```

#### 15. ENC - Enrich Company
```ruby
result = client.enc(query: "Apple Inc")
puts result.company.employee_count  # => 164000
```

#### 16. CEC - Company Employee Count
```ruby
result = client.cec(query: "Apple Inc")
puts result.countries  # => {"US" => 100000, "CA" => 5000}
```

#### 17. CLO - Company Locations
```ruby
result = client.clo(query: "Apple Inc")
puts result.locations.first.city  # => "Cupertino"
```

#### 18. CSE - Company Search Engine
```ruby
result = client.cse(name: "tech", country: "US", industry: "software")
puts result.companies.length  # => 50
```

#### 19. PSE - Person Search Engine
```ruby
result = client.pse(full_name: "John", country: "US", company_name: "Apple")
puts result.peoples.length  # => 25
```

#### 20. LBS - Local Business Search
```ruby
result = client.lbs(name: "restaurant", city: "New York")
puts result.companies.length  # => 100
```

### Error Handling

The Client provides comprehensive error handling:

```ruby
begin
  result = client.cuf(company_name: "Apple Inc", country_code: "US")
rescue Cufinder::AuthenticationError => e
  puts "Authentication failed: #{e.message}"
rescue Cufinder::RateLimitError => e
  puts "Rate limit exceeded: #{e.message}"
rescue Cufinder::CreditLimitError => e
  puts "Credit limit exceeded: #{e.message}"
rescue Cufinder::ApiError => e
  puts "API error #{e.status}: #{e.message}"
rescue Cufinder::ValidationError => e
  puts "Validation error: #{e.message}"
end
```

### Configuration

You can configure the Client with custom settings:

```ruby
sdk = Cufinder::Client.new(
  api_key: 'your-api-key',
  timeout: 30,                              # Default
  max_retries: 3                           # Default
)
```