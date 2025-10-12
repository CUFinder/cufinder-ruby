require "cufinder_ruby/client"
require "cufinder_ruby/services"

module CufinderRuby
  class SDK
    attr_reader :client, :services
    
    def initialize(api_key:, base_url: "https://api.cufinder.io/v2", timeout: 30, max_retries: 3)
      @client = Client.new(
        api_key: api_key,
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries
      )
      @services = Services.new(@client)
    end
    
    # Convenience methods for each service
    def cuf(company_name:, country_code:)
      @services.get_domain(company_name: company_name, country_code: country_code)
    end
    
    def lcuf(company_name:)
      @services.get_linkedin_url(company_name: company_name)
    end
    
    def dtc(company_website:)
      @services.get_company_name(company_website: company_website)
    end
    
    def dte(company_website:)
      @services.get_emails(company_website: company_website)
    end
    
    def ntp(company_name:)
      @services.get_phones(company_name: company_name)
    end
    
    def rel(email:)
      @services.get_person_by_email(email: email)
    end
    
    def fcl(query:)
      @services.find_company_lookalikes(query: query)
    end
    
    def elf(query:)
      @services.enrich_linkedin_fundraising(query: query)
    end
    
    def car(query:)
      @services.get_annual_revenue(query: query)
    end
    
    def fcc(query:)
      @services.find_company_children(query: query)
    end
    
    def fts(query:)
      @services.find_tech_stack(query: query)
    end
    
    def epp(linkedin_url:)
      @services.enrich_person_profile(linkedin_url: linkedin_url)
    end
    
    def fwe(linkedin_url:)
      @services.find_work_email(linkedin_url: linkedin_url)
    end
    
    def tep(full_name:, company:)
      @services.get_title_email_phone(full_name: full_name, company: company)
    end
    
    def enc(query:)
      @services.enrich_company(query: query)
    end
    
    def cec(query:)
      @services.get_company_employee_count(query: query)
    end
    
    def clo(query:)
      @services.get_company_locations(query: query)
    end
    
    def cse(**params)
      @services.search_companies(params)
    end
    
    def pse(**params)
      @services.search_people(params)
    end
    
    def lbs(**params)
      @services.search_local_businesses(params)
    end
  end
end
