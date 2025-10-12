require "spec_helper"
require "webmock/rspec"

RSpec.describe CufinderRuby do
  let(:api_key) { "test-api-key" }
  let(:sdk) { CufinderRuby::SDK.new(api_key: api_key) }
  
  before do
    # Mock successful responses for all services
    stub_request(:post, "https://api.cufinder.io/v2/cuf")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          domain: "example.com",
          confidence_level: 95,
          credit_count: 100
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/lcuf")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          linkedin_url: "linkedin.com/company/example",
          confidence_level: 90,
          credit_count: 95
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/dtc")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          company_name: "Example Corp",
          confidence_level: 88,
          credit_count: 90
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/dte")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          emails: ["contact@example.com", "info@example.com"],
          confidence_level: 85,
          credit_count: 85
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/ntp")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          phones: ["+1-555-123-4567", "+1-555-987-6543"],
          confidence_level: 82,
          credit_count: 80
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/rel")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          person: {
            full_name: "John Doe",
            first_name: "John",
            last_name: "Doe",
            linkedin_url: "linkedin.com/in/johndoe",
            job_title: "Software Engineer",
            company_name: "Example Corp"
          },
          confidence_level: 88,
          credit_count: 75
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/fcl")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          companies: [
            {
              name: "Similar Corp 1",
              domain: "similar1.com",
              industry: "Technology"
            },
            {
              name: "Similar Corp 2",
              domain: "similar2.com",
              industry: "Technology"
            }
          ],
          confidence_level: 90,
          credit_count: 70
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/elf")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          fundraising_info: {
            funding_last_round_type: "Series A",
            funding_money_raised: "$5M",
            funding_ammount_currency_code: "USD"
          },
          confidence_level: 85,
          credit_count: 65
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/car")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          annual_revenue: "$10M",
          confidence_level: 80,
          credit_count: 60
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/fcc")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          subsidiaries: ["Subsidiary 1", "Subsidiary 2"],
          confidence_level: 78,
          credit_count: 55
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/fts")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          technologies: ["React", "Node.js", "Python"],
          confidence_level: 85,
          credit_count: 50
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/epp")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          person: {
            full_name: "Jane Smith",
            first_name: "Jane",
            last_name: "Smith",
            linkedin_url: "linkedin.com/in/janesmith",
            job_title: "Product Manager",
            company_name: "Tech Corp"
          },
          confidence_level: 90,
          credit_count: 45
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/fwe")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          work_email: "jane.smith@techcorp.com",
          confidence_level: 88,
          credit_count: 40
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/tep")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          person: {
            full_name: "Bob Johnson",
            first_name: "Bob",
            last_name: "Johnson",
            email: "bob.johnson@company.com",
            phone: "+1-555-123-4567",
            job_title: "Sales Director"
          },
          confidence_level: 85,
          credit_count: 35
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/enc")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          company: {
            name: "Enriched Corp",
            domain: "enriched.com",
            industry: "Software",
            employee_count: 150,
            founded_year: "2010"
          },
          confidence_level: 90,
          credit_count: 30
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/cec")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          countries: { "US" => 100, "CA" => 50 },
          confidence_level: 85,
          credit_count: 25
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/clo")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          locations: [
            {
              country: "US",
              state: "CA",
              city: "San Francisco",
              latitude: "37.7749",
              longitude: "-122.4194"
            }
          ],
          confidence_level: 88,
          credit_count: 20
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/cse")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          companies: [
            {
              name: "Search Result 1",
              domain: "search1.com",
              industry: "Technology"
            }
          ],
          confidence_level: 85,
          credit_count: 15
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/pse")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          peoples: [
            {
              full_name: "Search Person 1",
              first_name: "Search",
              last_name: "Person",
              company: {
                name: "Search Corp",
                domain: "searchcorp.com"
              }
            }
          ],
          confidence_level: 80,
          credit_count: 10
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/lbs")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, body: {
        status: 1,
        data: {
          companies: [
            {
              name: "Local Business 1",
              domain: "local1.com",
              industry: "Retail"
            }
          ],
          confidence_level: 75,
          credit_count: 5
        }
      }.to_json)
  end
  
  describe "CUF Service" do
    it "gets company domain" do
      result = sdk.cuf(company_name: "Example Corp", country_code: "US")
      
      expect(result).to be_a(CufinderRuby::CufResponse)
      expect(result.domain).to eq("example.com")
      expect(result.confidence_level).to eq(95)
      expect(result.credit_count).to eq(100)
    end
  end
  
  describe "LCUF Service" do
    it "gets LinkedIn URL" do
      result = sdk.lcuf(company_name: "Example Corp")
      
      expect(result).to be_a(CufinderRuby::LcufResponse)
      expect(result.linkedin_url).to eq("linkedin.com/company/example")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "DTC Service" do
    it "gets company name from domain" do
      result = sdk.dtc(company_website: "example.com")
      
      expect(result).to be_a(CufinderRuby::DtcResponse)
      expect(result.company_name).to eq("Example Corp")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "DTE Service" do
    it "gets emails from domain" do
      result = sdk.dte(company_website: "example.com")
      
      expect(result).to be_a(CufinderRuby::DteResponse)
      expect(result.emails).to eq(["contact@example.com", "info@example.com"])
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "NTP Service" do
    it "gets phones from company name" do
      result = sdk.ntp(company_name: "Example Corp")
      
      expect(result).to be_a(CufinderRuby::NtpResponse)
      expect(result.phones).to eq(["+1-555-123-4567", "+1-555-987-6543"])
      expect(result.confidence_level).to eq(82)
    end
  end
  
  describe "REL Service" do
    it "gets person by email" do
      result = sdk.rel(email: "john@example.com")
      
      expect(result).to be_a(CufinderRuby::RelResponse)
      expect(result.person).to be_a(CufinderRuby::RelPerson)
      expect(result.person.full_name).to eq("John Doe")
      expect(result.person.job_title).to eq("Software Engineer")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "FCL Service" do
    it "finds company lookalikes" do
      result = sdk.fcl(query: "tech startup")
      
      expect(result).to be_a(CufinderRuby::FclResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(2)
      expect(result.companies.first).to be_a(CufinderRuby::FclCompany)
      expect(result.companies.first.name).to eq("Similar Corp 1")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "ELF Service" do
    it "enriches LinkedIn fundraising info" do
      result = sdk.elf(query: "tech company")
      
      expect(result).to be_a(CufinderRuby::ElfResponse)
      expect(result.fundraising).to be_a(CufinderRuby::ElfFundraising)
      expect(result.fundraising.funding_last_round_type).to eq("Series A")
      expect(result.fundraising.funding_money_raised).to eq("$5M")
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "CAR Service" do
    it "gets annual revenue" do
      result = sdk.car(query: "tech company")
      
      expect(result).to be_a(CufinderRuby::CarResponse)
      expect(result.revenue).to eq("$10M")
      expect(result.confidence_level).to eq(80)
    end
  end
  
  describe "FCC Service" do
    it "finds company children" do
      result = sdk.fcc(query: "parent company")
      
      expect(result).to be_a(CufinderRuby::FccResponse)
      expect(result.subsidiaries).to eq(["Subsidiary 1", "Subsidiary 2"])
      expect(result.confidence_level).to eq(78)
    end
  end
  
  describe "FTS Service" do
    it "finds tech stack" do
      result = sdk.fts(query: "web development")
      
      expect(result).to be_a(CufinderRuby::FtsResponse)
      expect(result.technologies).to eq(["React", "Node.js", "Python"])
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "EPP Service" do
    it "enriches person profile" do
      result = sdk.epp(linkedin_url: "linkedin.com/in/janesmith")
      
      expect(result).to be_a(CufinderRuby::EppResponse)
      expect(result.person).to be_a(CufinderRuby::EppPerson)
      expect(result.person.full_name).to eq("Jane Smith")
      expect(result.person.job_title).to eq("Product Manager")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "FWE Service" do
    it "finds work email" do
      result = sdk.fwe(linkedin_url: "linkedin.com/in/janesmith")
      
      expect(result).to be_a(CufinderRuby::FweResponse)
      expect(result.email).to eq("jane.smith@techcorp.com")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "TEP Service" do
    it "gets title, email, and phone" do
      result = sdk.tep(full_name: "Bob Johnson", company: "Company Inc")
      
      expect(result).to be_a(CufinderRuby::TepResponse)
      expect(result.person).to be_a(CufinderRuby::TepPerson)
      expect(result.person.full_name).to eq("Bob Johnson")
      expect(result.person.email).to eq("bob.johnson@company.com")
      expect(result.person.phone).to eq("+1-555-123-4567")
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "ENC Service" do
    it "enriches company" do
      result = sdk.enc(query: "tech startup")
      
      expect(result).to be_a(CufinderRuby::EncResponse)
      expect(result.company).to be_a(CufinderRuby::EncCompany)
      expect(result.company.name).to eq("Enriched Corp")
      expect(result.company.employee_count).to eq(150)
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "CEC Service" do
    it "gets company employee count" do
      result = sdk.cec(query: "tech company")
      
      expect(result).to be_a(CufinderRuby::CecResponse)
      expect(result.countries).to eq({ "US" => 100, "CA" => 50 })
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "CLO Service" do
    it "gets company locations" do
      result = sdk.clo(query: "tech company")
      
      expect(result).to be_a(CufinderRuby::CloResponse)
      expect(result.locations).to be_an(Array)
      expect(result.locations.length).to eq(1)
      expect(result.locations.first).to be_a(CufinderRuby::CloLocation)
      expect(result.locations.first.city).to eq("San Francisco")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "CSE Service" do
    it "searches companies" do
      result = sdk.cse(name: "tech", country: "US")
      
      expect(result).to be_a(CufinderRuby::CseResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(1)
      expect(result.companies.first).to be_a(CufinderRuby::Company)
      expect(result.companies.first.name).to eq("Search Result 1")
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "PSE Service" do
    it "searches people" do
      result = sdk.pse(full_name: "John", country: "US")
      
      expect(result).to be_a(CufinderRuby::PseResponse)
      expect(result.peoples).to be_an(Array)
      expect(result.peoples.length).to eq(1)
      expect(result.peoples.first).to be_a(CufinderRuby::Person)
      expect(result.peoples.first.full_name).to eq("Search Person 1")
      expect(result.confidence_level).to eq(80)
    end
  end
  
  describe "LBS Service" do
    it "searches local businesses" do
      result = sdk.lbs(name: "restaurant", city: "New York")
      
      expect(result).to be_a(CufinderRuby::LbsResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(1)
      expect(result.companies.first).to be_a(CufinderRuby::Company)
      expect(result.companies.first.name).to eq("Local Business 1")
      expect(result.confidence_level).to eq(75)
    end
  end
  
  describe "Error Handling" do
    it "handles authentication errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 401, body: "Unauthorized")
      
      expect {
        sdk.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(CufinderRuby::AuthenticationError)
    end
    
    it "handles rate limit errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 429, body: "Rate limit exceeded")
      
      expect {
        sdk.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(CufinderRuby::RateLimitError)
    end
    
    it "handles credit limit errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 402, body: "Credit limit exceeded")
      
      expect {
        sdk.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(CufinderRuby::CreditLimitError)
    end
    
    it "handles API errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 500, body: "Internal server error")
      
      expect {
        sdk.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(CufinderRuby::ApiError)
    end
    
    it "validates required parameters" do
      expect {
        sdk.cuf(company_name: "", country_code: "US")
      }.to raise_error(CufinderRuby::ValidationError, /Missing required fields/)
    end
  end
end
