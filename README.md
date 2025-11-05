# CUFinder Ruby SDK

[![](https://img.shields.io/badge/repo%20status-Active-28a745)](https://github.com/cufinder/cufinder-ruby)
[![License: MIT](https://img.shields.io/badge/License-MIT-514BEE.svg)](https://opensource.org/licenses/MIT)
[![Gem Version](https://img.shields.io/gem/v/cufinder-ruby.svg)](https://rubygems.org/gems/cufinder-ruby)

A Ruby SDK for the CUFinder API that provides access to all company and person enrichment services.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Error Handling](#error-handling)
- [Types](#types)
- [Support](#support)

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

```ruby
require 'cufinder_ruby'

# Initialize the client
client = Cufinder::Client.new(api_key: 'your-api-key-here')

# Initialize with more options
client = Cufinder::Client.new(
  api_key: 'your-api-key-here',
  timeout: 60,
  max_retries: 3
)
```

## API Reference

This SDK covers all 20 Cufinder API (v2) endpoints:

- **CUF** - [Company Name to Domain](https://apidoc.cufinder.io/apis/company-name-to-domain)
- **LCUF** - [LinkedIn Company URL Finder](https://apidoc.cufinder.io/apis/company-linkedin-url-finder)
- **DTC** - [Domain to Company Name](https://apidoc.cufinder.io/apis/domain-to-company-name)
- **DTE** - [Company Email Finder](https://apidoc.cufinder.io/apis/company-email-finder)
- **NTP** - [Company Phone Finder](https://apidoc.cufinder.io/apis/company-phone-finder)
- **REL** - [Reverse Email Lookup](https://apidoc.cufinder.io/apis/reverse-email-lookup)
- **FCL** - [Company Lookalikes Finder](https://apidoc.cufinder.io/apis/company-lookalikes-finder)
- **ELF** - [Company Fundraising](https://apidoc.cufinder.io/apis/company-fundraising)
- **CAR** - [Company Revenue Finder](https://apidoc.cufinder.io/apis/company-revenue-finder)
- **FCC** - [Company Subsidiaries Finder](https://apidoc.cufinder.io/apis/company-subsidiaries-finder)
- **FTS** - [Company Tech Stack Finder](https://apidoc.cufinder.io/apis/company-tech-stack-finder)
- **EPP** - [LinkedIn Profile Enrichment](https://apidoc.cufinder.io/apis/linkedin-profile-enrichment)
- **FWE** - [LinkedIn Profile Email Finder](https://apidoc.cufinder.io/apis/linkedin-profile-email-finder)
- **TEP** - [Person Enrichment](https://apidoc.cufinder.io/apis/person-enrichment)
- **ENC** - [Company Enrichment](https://apidoc.cufinder.io/apis/company-enrichment)
- **CEC** - [Company Employee Count](https://apidoc.cufinder.io/apis/company-employee-count)
- **CLO** - [Company Locations](https://apidoc.cufinder.io/apis/company-locations)
- **CSE** - [Company Search](https://apidoc.cufinder.io/apis/company-search)
- **PSE** - [Person Search](https://apidoc.cufinder.io/apis/person-search)
- **LBS** - [Local Business Search (Google Maps Search API)](https://apidoc.cufinder.io/apis/local-business-search-google-maps-search-api)


**CUF - Company Name to Domain**

Returns the official website URL of a company based on its name.

```ruby
result = client.cuf(company_name: 'cufinder', country_code: 'US')
puts result
```

**LCUF - LinkedIn Company URL Finder**

Finds the official LinkedIn company profile URL from a company name.

```ruby
result = client.lcuf(company_name: 'cufinder')
puts result
```

**DTC - Domain to Company Name**

Retrieves the registered company name associated with a given website domain.

```ruby
result = client.dtc(company_website: 'cufinder.io')
puts result
```

**DTE - Company Email Finder**

Returns up to five general or role-based business email addresses for a company.

```ruby
result = client.dte(company_website: 'cufinder.io')
puts result
```

**NTP - Company Phone Finder**

Returns up to two verified phone numbers for a company.

```ruby
result = client.ntp(company_name: 'apple')
puts result
```

**REL - Reverse Email Lookup**

Enriches an email address with detailed person and company information.

```ruby
result = client.rel(email: 'iain.mckenzie@stripe.com')
puts result
```

**FCL - Company Lookalikes Finder**

Provides a list of similar companies based on an input company's profile.

```ruby
result = client.fcl(query: 'apple')
puts result
```

**ELF - Company Fundraising**

Returns detailed funding information about a company.

```ruby
result = client.elf(query: 'cufinder')
puts result
```

**CAR - Company Revenue Finder**

Estimates a company's annual revenue based on name.

```ruby
result = client.car(query: 'apple')
puts result
```

**FCC - Company Subsidiaries Finder**

Identifies known subsidiaries of a parent company.

```ruby
result = client.fcc(query: 'amazon')
puts result
```

**FTS - Company Tech Stack Finder**

Detects the technologies a company uses.

```ruby
result = client.fts(query: 'cufinder')
puts result
```

**EPP - LinkedIn Profile Enrichment**

Takes a LinkedIn profile URL and returns enriched person and company data.

```ruby
result = client.epp(linkedin_url: 'linkedin.com/in/iain-mckenzie')
puts result
```

**FWE - LinkedIn Profile Email Finder**

Extracts a verified business email address from a LinkedIn profile URL.

```ruby
result = client.fwe(linkedin_url: 'linkedin.com/in/iain-mckenzie')
puts result
```

**TEP - Person Enrichment**

Returns enriched person data based on full name and company name.

```ruby
result = client.tep(full_name: 'iain mckenzie', company: 'stripe')
puts result
```

**ENC - Company Enrichment**

Provides a complete company profile from a company name.

```ruby
result = client.enc(query: 'cufinder')
puts result
```

**CEC - Company Employee Count**

Returns an estimated number of employees for a company.

```ruby
result = client.cec(query: 'cufinder')
puts result
```

**CLO - Company Locations**

Returns the known physical office locations of a company.

```ruby
result = client.clo(query: 'apple')
puts result
```

**CSE - Company Search**

Search for companies by keyword, partial name, industry, location, or other filters.

```ruby
result = client.cse(
  name: 'cufinder',
  country: 'germany',
  state: 'hamburg',
  city: 'hamburg'
)
puts result
```

**PSE - Person Search**

Search for people by name, company, job title, location, or other filters.

```ruby
result = client.pse(
  full_name: 'iain mckenzie',
  company_name: 'stripe'
)
puts result
```

**LBS - Local Business Search (Google Maps Search API)**

Search for local businesses by location, industry, or name.

```ruby
result = client.lbs(
  country: 'united states',
  state: 'california',
  page: 1
)
puts result
```

## Error Handling

The SDK provides comprehensive error handling with custom error types:

```ruby
require 'cufinder_ruby'

begin
  result = client.cuf(company_name: 'cufinder', country_code: 'US')
rescue Cufinder::AuthenticationError => e
  # 401 - Invalid API key
  puts "Authentication failed: #{e.message}"
rescue Cufinder::CreditLimitError => e
  # 400 - Not enough credit
  puts "Not enough credit: #{e.message}"
rescue Cufinder::NotFoundError => e
  # 404 - Not found result
  puts "Not found result: #{e.message}"
rescue Cufinder::PayloadError => e
  # 422 - Error in the payload
  puts "Payload error: #{e.message}"
rescue Cufinder::RateLimitError => e
  # 429 - Rate limit exceeded
  puts "Rate limit exceeded: #{e.message}"
rescue Cufinder::ServerError => e
  # 500, 501, ... - Server errors
  puts "Server error (#{e.status}): #{e.message}"
rescue Cufinder::NetworkError => e
  puts "Network error: #{e.message}"
rescue Cufinder::ValidationError => e
  puts "Validation error: #{e.message}"
rescue Cufinder::ApiError => e
  puts "Unknown error: #{e.message}"
end
```

## Types

The SDK exports comprehensive Ruby classes for all API requests and responses:

```ruby
# Response classes
class BaseResponse
  attr_reader :query, :credit_count
end

# Model classes
class Company
  # The Company class contains all returned company data.
  attr_reader :name, :domain, :website, :linkedin_url
  attr_reader :country, :state, :city, :address
  attr_reader :industry, :company_size, :revenue
  attr_reader :employee_count, :subsidiaries, :tech_stack
  attr_reader :emails, :phones, :description
  attr_reader :locations, :founded_year, :logo_url
end

class Person
  # The Person class contains all returned person data.
  attr_reader :full_name, :first_name, :last_name
  attr_reader :company_name, :company_domain, :job_title
  attr_reader :country, :state, :city
  attr_reader :email, :phone, :description, :linkedin_url
end

class LookalikeCompany
  # The LookalikeCompany class contains all returned lookalike company data.
  attr_reader :name, :domain, :website, :linkedin_url
  attr_reader :country, :state, :city, :address
  attr_reader :industry, :company_size, :revenue
  attr_reader :employee_count, :subsidiaries, :tech_stack
  attr_reader :emails, :phones, :description
  attr_reader :locations, :founded_year, :logo_url
end

class FundraisingInfo
  attr_reader :funding_last_round_type
  attr_reader :funding_ammount_currency_code
  attr_reader :funding_money_raised
  attr_reader :funding_last_round_investors_url
end

class CompanyLocation
  # The CompanyLocation class contains all returned company location data.
  attr_reader :country, :state, :city, :postal_code
  attr_reader :line1, :line2, :latitude, :longitude
end

class CompanySearchResult
  attr_reader :companies, :total_results, :page
  attr_reader :query, :credit_count
end

class PersonSearchResult
  attr_reader :peoples, :total_results, :page
  attr_reader :query, :credit_count
end

class LocalBusinessResult
  attr_reader :businesses, :total_results, :page
  attr_reader :query, :credit_count
end

# Configuration
class ClientConfig
  attr_accessor :api_key, :base_url, :timeout, :max_retries
end

# Error classes
class CufinderError < StandardError; end
class AuthenticationError < CufinderError; end
class CreditLimitError < CufinderError; end
class NotFoundError < CufinderError; end
class PayloadError < CufinderError; end
class RateLimitError < CufinderError; end
class ServerError < CufinderError; end
class NetworkError < CufinderError; end
class ValidationError < CufinderError; end
class ApiError < CufinderError; end
```

## Support

For support, please open an issue on the [GitHub repository](https://github.com/cufinder/cufinder-ruby/issues).
