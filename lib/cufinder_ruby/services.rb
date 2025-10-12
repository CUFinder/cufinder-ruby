require "cufinder_ruby/client"
require "cufinder_ruby/types"
require "cufinder_ruby/errors"

module CufinderRuby
  class Services
    def initialize(client)
      @client = client
    end
    
    # CUF Service - Company URL Finder
    def get_domain(params)
      validate_required(params, [:company_name, :country_code])
      
      response = @client.post("/cuf", params)
      CufResponse.new(response)
    end
    
    # LCUF Service - LinkedIn Company URL Finder
    def get_linkedin_url(params)
      validate_required(params, [:company_name])
      
      response = @client.post("/lcuf", params)
      LcufResponse.new(response)
    end
    
    # DTC Service - Domain to Company
    def get_company_name(params)
      validate_required(params, [:company_website])
      
      response = @client.post("/dtc", params)
      DtcResponse.new(response)
    end
    
    # DTE Service - Domain to Emails
    def get_emails(params)
      validate_required(params, [:company_website])
      
      response = @client.post("/dte", params)
      DteResponse.new(response)
    end
    
    # NTP Service - Name to Phones
    def get_phones(params)
      validate_required(params, [:company_name])
      
      response = @client.post("/ntp", params)
      NtpResponse.new(response)
    end
    
    # REL Service - Reverse Email Lookup
    def get_person_by_email(params)
      validate_required(params, [:email])
      
      response = @client.post("/rel", params)
      RelResponse.new(response)
    end
    
    # FCL Service - Find Company Lookalikes
    def find_company_lookalikes(params)
      validate_required(params, [:query])
      
      response = @client.post("/fcl", params)
      FclResponse.new(response)
    end
    
    # ELF Service - Enrich LinkedIn Fundraising
    def enrich_linkedin_fundraising(params)
      validate_required(params, [:query])
      
      response = @client.post("/elf", params)
      ElfResponse.new(response)
    end
    
    # CAR Service - Company Annual Revenue
    def get_annual_revenue(params)
      validate_required(params, [:query])
      
      response = @client.post("/car", params)
      CarResponse.new(response)
    end
    
    # FCC Service - Find Company Children
    def find_company_children(params)
      validate_required(params, [:query])
      
      response = @client.post("/fcc", params)
      FccResponse.new(response)
    end
    
    # FTS Service - Find Tech Stack
    def find_tech_stack(params)
      validate_required(params, [:query])
      
      response = @client.post("/fts", params)
      FtsResponse.new(response)
    end
    
    # EPP Service - Enrich Person Profile
    def enrich_person_profile(params)
      validate_required(params, [:linkedin_url])
      
      response = @client.post("/epp", params)
      EppResponse.new(response)
    end
    
    # FWE Service - Find Work Email
    def find_work_email(params)
      validate_required(params, [:linkedin_url])
      
      response = @client.post("/fwe", params)
      FweResponse.new(response)
    end
    
    # TEP Service - Title Email Phone
    def get_title_email_phone(params)
      validate_required(params, [:full_name, :company])
      
      response = @client.post("/tep", params)
      TepResponse.new(response)
    end
    
    # ENC Service - Enrich Company
    def enrich_company(params)
      validate_required(params, [:query])
      
      response = @client.post("/enc", params)
      EncResponse.new(response)
    end
    
    # CEC Service - Company Employee Count
    def get_company_employee_count(params)
      validate_required(params, [:query])
      
      response = @client.post("/cec", params)
      CecResponse.new(response)
    end
    
    # CLO Service - Company Locations
    def get_company_locations(params)
      validate_required(params, [:query])
      
      response = @client.post("/clo", params)
      CloResponse.new(response)
    end
    
    # CSE Service - Company Search Engine
    def search_companies(params)
      # All parameters are optional for CSE
      response = @client.post("/cse", params)
      CseResponse.new(response)
    end
    
    # PSE Service - Person Search Engine
    def search_people(params)
      # All parameters are optional for PSE
      response = @client.post("/pse", params)
      PseResponse.new(response)
    end
    
    # LBS Service - Local Business Search
    def search_local_businesses(params)
      # All parameters are optional for LBS
      response = @client.post("/lbs", params)
      LbsResponse.new(response)
    end
    
    private
    
    def validate_required(params, required_fields)
      missing_fields = required_fields.select { |field| params[field].nil? || params[field].to_s.strip.empty? }
      
      unless missing_fields.empty?
        raise ValidationError, "Missing required fields: #{missing_fields.join(', ')}"
      end
    end
  end
end
