require "spec_helper"
require "webmock/rspec"

RSpec.describe Cufinder do
  let(:api_key) { "test-api-key" }
  let(:client) { Cufinder::Client.new(api_key: api_key) }
  
  before do
    # Mock successful responses for all services
    stub_request(:post, "https://api.cufinder.io/v2/cuf")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          domain: "example.com",
          confidence_level: 95,
          credit_count: 100
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/lcuf")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          linkedin_url: "linkedin.com/company/example",
          confidence_level: 90,
          credit_count: 95
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/dtc")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          company_name: "Example Corp",
          confidence_level: 88,
          credit_count: 90
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/dte")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          emails: ["contact@example.com", "info@example.com"],
          confidence_level: 85,
          credit_count: 85
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/ntp")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          phones: ["+1-555-123-4567", "+1-555-987-6543"],
          confidence_level: 82,
          credit_count: 80
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/rel")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          annual_revenue: "$10M",
          confidence_level: 80,
          credit_count: 60
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/fcc")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          subsidiaries: ["Subsidiary 1", "Subsidiary 2"],
          confidence_level: 78,
          credit_count: 55
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/fts")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          technologies: ["React", "Node.js", "Python"],
          confidence_level: 85,
          credit_count: 50
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/epp")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          work_email: "jane.smith@techcorp.com",
          confidence_level: 88,
          credit_count: 40
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/tep")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          countries: { "US" => 100, "CA" => 50 },
          confidence_level: 85,
          credit_count: 25
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/clo")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
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
    
    stub_request(:post, "https://api.cufinder.io/v2/cef")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          employees: [
            {
              full_name: "John Doe",
              first_name: "John",
              last_name: "Doe",
              linkedin_url: "linkedin.com/in/johndoe",
              job_title: "Software Engineer",
              company_name: "Example Corp",
              company_industry: "Technology",
              country: "US",
              state: "CA",
              city: "San Francisco"
            },
            {
              full_name: "Jane Smith",
              first_name: "Jane",
              last_name: "Smith",
              linkedin_url: "linkedin.com/in/janesmith",
              job_title: "Product Manager",
              company_name: "Example Corp",
              company_industry: "Technology",
              country: "US",
              state: "NY",
              city: "New York"
            }
          ],
          confidence_level: 90,
          credit_count: 80
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/nac")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          company: "Cufinder Inc.",
          confidence_level: 95,
          credit_count: 1
        }
      }.to_json)
    
    stub_request(:post, "https://api.cufinder.io/v2/caa")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          activities: [
            {
              activity_url: "https://www.linkedin.com/posts/example-activity-123",
              activity_id: "7462132400869888002",
              author_name: "TechCorp",
              author_type: "Organization",
              author_url: "linkedin.com/company/techcorp",
              activity_comments_count: 59,
              activity_hashtags: ["#AI", "#Anthropic", "#CUFinder"],
              activity_headline: "AI Growth Update",
              activity_images: ["https://media.licdn.com/image.jpg"],
              activity_is_video: true,
              activity_posted_at: "2026-05-18T13:30:04.063Z",
              activity_reactions_count: 3,
              activity_reposts_count: 0,
              activity_text: "Anthropic is projected to grow 222x by 2030",
              activity_top_comments: [],
              activity_videos: ["https://dms.licdn.com/video.mp4"]
            }
          ],
          confidence_level: 90,
          credit_count: 1
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/cja")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          jobs: [
            {
              company: {
                name: "Example Corp",
                industry: "Technology",
                website: "example.com",
                linkedin: "linkedin.com/company/example",
                followers_count: 5000,
                employees: { range: "51-200" },
                founded_date: "2015",
                annual_revenue: "$10M",
                funding_amount: 5000000,
                main_location: {
                  country: "US",
                  state: "CA",
                  city: "San Francisco"
                }
              },
              job: {
                job_id: "job-123",
                title: "Software Engineer",
                url: "https://example.com/jobs/123",
                location: "San Francisco, CA",
                posted_at: "2026-06-01T00:00:00.000Z",
                posted_at_text: "20 days ago"
              }
            }
          ],
          confidence_level: 85,
          credit_count: 98
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/psa")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          contacts: [
            {
              full_name: "John Doe",
              current_job: { title: "Software Engineer" },
              company: {
                name: "TechCorp",
                linkedin: "linkedin.com/company/techcorp",
                website: "https://techcorp.com",
                industry: "software development",
                main_location: {
                  country: "united states",
                  state: "california",
                  city: "san francisco"
                }
              },
              location: {
                country: "united states",
                state: "california",
                city: "san francisco"
              },
              signal: {
                name: "employee_growth",
                time_frame: 90,
                bucket: "high"
              }
            }
          ],
          query: {
            signal_name: "employee_growth",
            time_frame: 90,
            bucket: "high",
            page: 1
          },
          credit_count: 1,
          meta_data: { total_results: 1 }
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/csa")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          companies: [
            {
              name: "TechCorp",
              website: "https://techcorp.com",
              domain: "techcorp.com",
              industry: "software development",
              overview: "Enterprise software company",
              type: "private",
              employees: { range: "1001-5000" },
              main_location: {
                country: "united states",
                state: "california",
                city: "san francisco",
                address: "123 Tech St"
              },
              signal: {
                name: "employee_growth",
                time_frame: 90,
                bucket: "high"
              }
            }
          ],
          query: {
            signal_name: "employee_growth",
            time_frame: 90,
            bucket: "high",
            page: 1
          },
          credit_count: 1,
          meta_data: { total_results: 1 }
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/jca")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          job_changes: [
            {
              type: "promotion",
              linkedin_url: "https://linkedin.com/in/john-doe",
              detected_at: "2026-08-01T12:00:00Z",
              from: {
                company_linkedin_url: "https://linkedin.com/company/techcorp",
                company_linkedin_id: "12345",
                company_name: "TechCorp",
                title: "Software Engineer"
              },
              to: {
                company_linkedin_url: "https://linkedin.com/company/techcorp",
                company_linkedin_id: "12345",
                company_name: "TechCorp",
                title: "Senior Software Engineer"
              }
            }
          ],
          query: {
            start_date: "2026-01-01",
            end_date: "2026-08-16",
            type: "promotion"
          },
          credit_count: 1,
          meta_data: { total_results: 1 }
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/clf")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          profiles: [
            {
              full_name: "Morteza Heydari",
              linkedin_url: "https://linkedin.com/in/mortezaheydari1997",
              job_title: "Founder & CEO",
              company_name: "CUFinder",
              country: "united states",
              state: "new york",
              city: "new york"
            }
          ],
          query: "linkedin.com/in/mortezaheydari1997",
          credit_count: 1,
          meta_data: { total_results: 1 }
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/nap")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          normalized_name: "Morteza Heydari",
          query: "morteza heydari",
          credit_count: 1
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/nau")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          normalized_url: "https://www.cufinder.io/about-us",
          query: "https://www.cufinder.io/about-us",
          credit_count: 1
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/gdc")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          offers_demo: "yes",
          query: "https://www.stripe.com",
          credit_count: 1
        }
      }.to_json)

    stub_request(:post, "https://api.cufinder.io/v2/cot")
      .with(headers: { "x-api-key" => api_key })
      .to_return(status: 200, headers: { 'Content-Type' => 'application/json' }, body: {
        status: 1,
        data: {
          offers_free_trial: "yes",
          query: "https://www.stripe.com",
          credit_count: 1
        }
      }.to_json)
  end
  
  describe "CUF Service" do
    it "gets company domain" do
      result = client.cuf(company_name: "Example Corp", country_code: "US")
      
      expect(result).to be_a(Cufinder::CufResponse)
      expect(result.domain).to eq("example.com")
      expect(result.confidence_level).to eq(95)
      expect(result.credit_count).to eq(100)
    end
  end
  
  describe "LCUF Service" do
    it "gets LinkedIn URL" do
      result = client.lcuf(company_name: "Example Corp")
      
      expect(result).to be_a(Cufinder::LcufResponse)
      expect(result.linkedin_url).to eq("linkedin.com/company/example")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "DTC Service" do
    it "gets company name from domain" do
      result = client.dtc(company_website: "example.com")
      
      expect(result).to be_a(Cufinder::DtcResponse)
      expect(result.company_name).to eq("Example Corp")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "DTE Service" do
    it "gets emails from domain" do
      result = client.dte(company_website: "example.com")
      
      expect(result).to be_a(Cufinder::DteResponse)
      expect(result.emails).to eq(["contact@example.com", "info@example.com"])
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "NTP Service" do
    it "gets phones from company name" do
      result = client.ntp(company_name: "Example Corp")
      
      expect(result).to be_a(Cufinder::NtpResponse)
      expect(result.phones).to eq(["+1-555-123-4567", "+1-555-987-6543"])
      expect(result.confidence_level).to eq(82)
    end
  end
  
  describe "REL Service" do
    it "gets person by email" do
      result = client.rel(email: "john@example.com")
      
      expect(result).to be_a(Cufinder::RelResponse)
      expect(result.person).to be_a(Cufinder::RelPerson)
      expect(result.person.full_name).to eq("John Doe")
      expect(result.person.job_title).to eq("Software Engineer")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "FCL Service" do
    it "finds company lookalikes" do
      result = client.fcl(query: "tech startup")
      
      expect(result).to be_a(Cufinder::FclResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(2)
      expect(result.companies.first).to be_a(Cufinder::FclCompany)
      expect(result.companies.first.name).to eq("Similar Corp 1")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "ELF Service" do
    it "enriches LinkedIn fundraising info" do
      result = client.elf(query: "tech company")
      
      expect(result).to be_a(Cufinder::ElfResponse)
      expect(result.fundraising).to be_a(Cufinder::ElfFundraising)
      expect(result.fundraising.funding_last_round_type).to eq("Series A")
      expect(result.fundraising.funding_money_raised).to eq("$5M")
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "CAR Service" do
    it "gets annual revenue" do
      result = client.car(query: "tech company")
      
      expect(result).to be_a(Cufinder::CarResponse)
      expect(result.revenue).to eq("$10M")
      expect(result.confidence_level).to eq(80)
    end
  end
  
  describe "FCC Service" do
    it "finds company children" do
      result = client.fcc(query: "parent company")
      
      expect(result).to be_a(Cufinder::FccResponse)
      expect(result.subsidiaries).to eq(["Subsidiary 1", "Subsidiary 2"])
      expect(result.confidence_level).to eq(78)
    end
  end
  
  describe "FTS Service" do
    it "finds tech stack" do
      result = client.fts(query: "web development")
      
      expect(result).to be_a(Cufinder::FtsResponse)
      expect(result.technologies).to eq(["React", "Node.js", "Python"])
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "EPP Service" do
    it "enriches person profile" do
      result = client.epp(linkedin_url: "linkedin.com/in/janesmith")
      
      expect(result).to be_a(Cufinder::EppResponse)
      expect(result.person).to be_a(Cufinder::EppPerson)
      expect(result.person.full_name).to eq("Jane Smith")
      expect(result.person.job_title).to eq("Product Manager")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "FWE Service" do
    it "finds work email" do
      result = client.fwe(linkedin_url: "linkedin.com/in/janesmith")
      
      expect(result).to be_a(Cufinder::FweResponse)
      expect(result.email).to eq("jane.smith@techcorp.com")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "TEP Service" do
    it "gets title, email, and phone" do
      result = client.tep(full_name: "Bob Johnson", company: "Company Inc")
      
      expect(result).to be_a(Cufinder::TepResponse)
      expect(result.person).to be_a(Cufinder::TepPerson)
      expect(result.person.full_name).to eq("Bob Johnson")
      expect(result.person.email).to eq("bob.johnson@company.com")
      expect(result.person.phone).to eq("+1-555-123-4567")
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "ENC Service" do
    it "enriches company" do
      result = client.enc(query: "tech startup")
      
      expect(result).to be_a(Cufinder::EncResponse)
      expect(result.company).to be_a(Cufinder::EncCompany)
      expect(result.company.name).to eq("Enriched Corp")
      expect(result.company.employee_count).to eq(150)
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "CEC Service" do
    it "gets company employee count" do
      result = client.cec(query: "tech company")
      
      expect(result).to be_a(Cufinder::CecResponse)
      expect(result.countries).to eq({ "US" => 100, "CA" => 50 })
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "CLO Service" do
    it "gets company locations" do
      result = client.clo(query: "tech company")
      
      expect(result).to be_a(Cufinder::CloResponse)
      expect(result.locations).to be_an(Array)
      expect(result.locations.length).to eq(1)
      expect(result.locations.first).to be_a(Cufinder::CloLocation)
      expect(result.locations.first.city).to eq("San Francisco")
      expect(result.confidence_level).to eq(88)
    end
  end
  
  describe "CSE Service" do
    it "searches companies" do
      result = client.cse(name: "tech", country: "US")
      
      expect(result).to be_a(Cufinder::CseResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(1)
      expect(result.companies.first).to be_a(Cufinder::Company)
      expect(result.companies.first.name).to eq("Search Result 1")
      expect(result.confidence_level).to eq(85)
    end
  end
  
  describe "PSE Service" do
    it "searches people" do
      result = client.pse(full_name: "John", country: "US")
      
      expect(result).to be_a(Cufinder::PseResponse)
      expect(result.peoples).to be_an(Array)
      expect(result.peoples.length).to eq(1)
      expect(result.peoples.first).to be_a(Cufinder::Person)
      expect(result.peoples.first.full_name).to eq("Search Person 1")
      expect(result.confidence_level).to eq(80)
    end
  end
  
  describe "LBS Service" do
    it "searches local businesses" do
      result = client.lbs(name: "restaurant", city: "New York")
      
      expect(result).to be_a(Cufinder::LbsResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(1)
      expect(result.companies.first).to be_a(Cufinder::Company)
      expect(result.companies.first.name).to eq("Local Business 1")
      expect(result.confidence_level).to eq(75)
    end
  end
  
  describe "CEF Service" do
    it "finds company employees" do
      result = client.cef(query: "Example Corp", page: 1)
      
      expect(result).to be_a(Cufinder::CefResponse)
      expect(result.employees).to be_an(Array)
      expect(result.employees.length).to eq(2)
      expect(result.employees.first).to be_a(Cufinder::CefEmployee)
      expect(result.employees.first.full_name).to eq("John Doe")
      expect(result.employees.first.job_title).to eq("Software Engineer")
      expect(result.employees.first.company_name).to eq("Example Corp")
      expect(result.employees.first.country).to eq("US")
      expect(result.confidence_level).to eq(90)
    end
  end
  
  describe "NAC Service" do
    it "normalizes company name" do
      result = client.nac(company: "cufinder inc.")
      
      expect(result).to be_a(Cufinder::NacResponse)
      expect(result.company).to eq("Cufinder Inc.")
      expect(result.confidence_level).to eq(95)
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "CAA Service" do
    it "gets company activities" do
      result = client.caa(query: "TechCorp", page: 1)
      
      expect(result).to be_a(Cufinder::CaaResponse)
      expect(result.activities).to be_an(Array)
      expect(result.activities.length).to eq(1)
      expect(result.activities.first).to be_a(Cufinder::CaaActivity)
      expect(result.activities.first.activity_id).to eq("7462132400869888002")
      expect(result.activities.first.author_name).to eq("TechCorp")
      expect(result.activities.first.activity_comments_count).to eq(59)
      expect(result.activities.first.activity_hashtags).to eq(["#AI", "#Anthropic", "#CUFinder"])
      expect(result.activities.first.activity_is_video).to eq(true)
      expect(result.activities.first.activity_reactions_count).to eq(3)
      expect(result.confidence_level).to eq(90)
    end
  end

  describe "CJA Service" do
    it "searches company jobs" do
      result = client.cja(name: "Example Corp", country: "US")
      
      expect(result).to be_a(Cufinder::CjaResponse)
      expect(result.jobs).to be_an(Array)
      expect(result.jobs.length).to eq(1)
      expect(result.jobs.first).to be_a(Cufinder::CompanyJob)
      expect(result.jobs.first.company).to be_a(Cufinder::CjaCompany)
      expect(result.jobs.first.company.name).to eq("Example Corp")
      expect(result.jobs.first.company.industry).to eq("Technology")
      expect(result.jobs.first.company.followers_count).to eq(5000)
      expect(result.jobs.first.company.funding_amount).to eq(5000000)
      expect(result.jobs.first.company.main_location).to be_a(Cufinder::MainLocation)
      expect(result.jobs.first.company.main_location.city).to eq("San Francisco")
      expect(result.jobs.first.job).to be_a(Cufinder::CjaJob)
      expect(result.jobs.first.job.title).to eq("Software Engineer")
      expect(result.jobs.first.job.url).to eq("https://example.com/jobs/123")
      expect(result.jobs.first.job.posted_at_text).to eq("20 days ago")
      expect(result.confidence_level).to eq(85)
      expect(result.credit_count).to eq(98)
    end
  end
  
  describe "PSA Service" do
    it "gets contact signals" do
      result = client.psa(signal_name: "employee_growth", time_frame: 90, bucket: "high", page: 1)
      
      expect(result).to be_a(Cufinder::PsaResponse)
      expect(result.contacts).to be_an(Array)
      expect(result.contacts.length).to eq(1)
      expect(result.contacts.first).to be_a(Cufinder::ContactSignal)
      expect(result.contacts.first.full_name).to eq("John Doe")
      expect(result.contacts.first.current_job["title"]).to eq("Software Engineer")
      expect(result.contacts.first.company["name"]).to eq("TechCorp")
      expect(result.contacts.first.company["industry"]).to eq("software development")
      expect(result.contacts.first.signal).to be_a(Cufinder::Signal)
      expect(result.contacts.first.signal.name).to eq("employee_growth")
      expect(result.contacts.first.signal.time_frame).to eq(90)
      expect(result.contacts.first.signal.bucket).to eq("high")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "CSA Service" do
    it "gets company signals" do
      result = client.csa(signal_name: "employee_growth", time_frame: 90, bucket: "high", page: 1)
      
      expect(result).to be_a(Cufinder::CsaResponse)
      expect(result.companies).to be_an(Array)
      expect(result.companies.length).to eq(1)
      expect(result.companies.first).to be_a(Cufinder::CompanySignal)
      expect(result.companies.first.name).to eq("TechCorp")
      expect(result.companies.first.domain).to eq("techcorp.com")
      expect(result.companies.first.industry).to eq("software development")
      expect(result.companies.first.employees["range"]).to eq("1001-5000")
      expect(result.companies.first.main_location).to be_a(Cufinder::MainLocation)
      expect(result.companies.first.main_location.city).to eq("san francisco")
      expect(result.companies.first.signal).to be_a(Cufinder::Signal)
      expect(result.companies.first.signal.name).to eq("employee_growth")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "JCA Service" do
    it "gets job changes" do
      result = client.jca(start_date: "2026-01-01", end_date: "2026-08-16", type: "promotion")
      
      expect(result).to be_a(Cufinder::JcaResponse)
      expect(result.job_changes).to be_an(Array)
      expect(result.job_changes.length).to eq(1)
      expect(result.job_changes.first).to be_a(Cufinder::JobChange)
      expect(result.job_changes.first.type).to eq("promotion")
      expect(result.job_changes.first.linkedin_url).to eq("https://linkedin.com/in/john-doe")
      expect(result.job_changes.first.from).to be_a(Cufinder::JobChangeCompanySnapshot)
      expect(result.job_changes.first.from.company_name).to eq("TechCorp")
      expect(result.job_changes.first.from.title).to eq("Software Engineer")
      expect(result.job_changes.first.to).to be_a(Cufinder::JobChangeCompanySnapshot)
      expect(result.job_changes.first.to.title).to eq("Senior Software Engineer")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "CLF Service" do
    it "finds contact lookalikes" do
      result = client.clf(query: "linkedin.com/in/mortezaheydari1997")
      
      expect(result).to be_a(Cufinder::ClfResponse)
      expect(result.profiles).to be_an(Array)
      expect(result.profiles.length).to eq(1)
      expect(result.profiles.first).to be_a(Cufinder::ClfProfile)
      expect(result.profiles.first.full_name).to eq("Morteza Heydari")
      expect(result.profiles.first.linkedin_url).to eq("https://linkedin.com/in/mortezaheydari1997")
      expect(result.profiles.first.job_title).to eq("Founder & CEO")
      expect(result.profiles.first.company_name).to eq("CUFinder")
      expect(result.profiles.first.city).to eq("new york")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "NAP Service" do
    it "normalizes a person name" do
      result = client.nap(person_name: "morteza heydari")
      
      expect(result).to be_a(Cufinder::NapResponse)
      expect(result.normalized_name).to eq("Morteza Heydari")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "NAU Service" do
    it "normalizes a URL" do
      result = client.nau(url: "https://www.cufinder.io/about-us")
      
      expect(result).to be_a(Cufinder::NauResponse)
      expect(result.normalized_url).to eq("https://www.cufinder.io/about-us")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "GDC Service" do
    it "checks if a company gives demos" do
      result = client.gdc(url: "https://www.stripe.com")
      
      expect(result).to be_a(Cufinder::GdcResponse)
      expect(result.offers_demo).to eq("yes")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "COT Service" do
    it "checks if a company offers a free trial" do
      result = client.cot(url: "https://www.stripe.com")
      
      expect(result).to be_a(Cufinder::CotResponse)
      expect(result.offers_free_trial).to eq("yes")
      expect(result.credit_count).to eq(1)
    end
  end
  
  describe "Error Handling" do
    it "handles authentication errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 401, body: "Unauthorized")
      
      expect {
        client.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(Cufinder::AuthenticationError)
    end
    
    it "handles rate limit errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 429, body: "Rate limit exceeded")
      
      expect {
        client.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(Cufinder::RateLimitError)
    end
    
    it "handles credit limit errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 402, body: "Credit limit exceeded")
      
      expect {
        client.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(Cufinder::CreditLimitError)
    end
    
    it "handles API errors" do
      stub_request(:post, "https://api.cufinder.io/v2/cuf")
        .to_return(status: 500, body: "Internal server error")
      
      expect {
        client.cuf(company_name: "Example Corp", country_code: "US")
      }.to raise_error(Cufinder::ApiError)
    end
    
    it "validates required parameters" do
      expect {
        client.cuf(company_name: "", country_code: "US")
      }.to raise_error(Cufinder::ValidationError, /Missing required fields/)
    end
    
    it "validates PSA required parameters" do
      expect {
        client.psa(time_frame: 90, bucket: "high")
      }.to raise_error(Cufinder::ValidationError, /signal_name/)
      
      expect {
        client.psa(signal_name: "employee_growth", time_frame: 90)
      }.to raise_error(Cufinder::ValidationError, /bucket/)
    end
    
    it "validates CSA required parameters" do
      expect {
        client.csa(time_frame: 90, bucket: "high")
      }.to raise_error(Cufinder::ValidationError, /signal_name/)
      
      expect {
        client.csa(signal_name: "employee_growth")
      }.to raise_error(Cufinder::ValidationError, /bucket/)
    end
    
    it "validates JCA required parameters" do
      expect {
        client.jca(end_date: "2026-08-16")
      }.to raise_error(Cufinder::ValidationError, /start_date/)
      
      expect {
        client.jca(start_date: "2026-01-01")
      }.to raise_error(Cufinder::ValidationError, /end_date/)
    end
    
    it "validates CLF required parameters" do
      expect {
        client.clf(query: "")
      }.to raise_error(Cufinder::ValidationError, /query/)
    end
    
    it "validates NAP required parameters" do
      expect {
        client.nap(person_name: "")
      }.to raise_error(Cufinder::ValidationError, /person_name/)
    end
    
    it "validates NAU required parameters" do
      expect {
        client.nau(url: "")
      }.to raise_error(Cufinder::ValidationError, /url/)
    end
    
    it "validates GDC required parameters" do
      expect {
        client.gdc(url: "")
      }.to raise_error(Cufinder::ValidationError, /url/)
    end
    
    it "validates COT required parameters" do
      expect {
        client.cot(url: "")
      }.to raise_error(Cufinder::ValidationError, /url/)
    end
  end
end
