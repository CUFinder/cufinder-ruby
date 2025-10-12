module CufinderRuby
  # Base response structure for all CUFinder API responses
  class BaseResponse
    attr_accessor :query, :credit_count, :meta_data, :confidence_level
    
    def initialize(data = {})
      @query = data["query"]
      @credit_count = data["credit_count"]
      @meta_data = data["meta_data"]
      @confidence_level = data["confidence_level"]
    end
  end
  
  # Company main location
  class MainLocation
    attr_accessor :geo, :country, :state, :city, :address, :continent, :postal_code
    
    def initialize(data = {})
      @geo = data["geo"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @address = data["address"]
      @continent = data["continent"]
      @postal_code = data["postal_code"]
    end
  end
  
  # Company social media information
  class CompanySocial
    attr_accessor :facebook, :linkedin, :twitter, :youtube, :instagram
    
    def initialize(data = {})
      @facebook = data["facebook"]
      @linkedin = data["linkedin"]
      @twitter = data["twitter"]
      @youtube = data["youtube"]
      @instagram = data["instagram"]
    end
  end
  
  # Company employee information
  class CompanyEmployees
    attr_accessor :range, :count
    
    def initialize(data = {})
      @range = data["range"]
      @count = data["count"]
    end
  end
  
  # Company information model
  class Company
    attr_accessor :name, :domain, :linkedin_url, :industry, :overview, :type, :size,
                  :main_location, :location, :description, :founded, :revenue,
                  :employees, :website, :phone, :email, :social, :technologies,
                  :subsidiaries, :headquarters, :country, :state, :city, :zip_code, :address
    
    def initialize(data = {})
      @name = data["name"]
      @domain = data["domain"]
      @linkedin_url = data["linkedin_url"]
      @industry = data["industry"]
      @overview = data["overview"]
      @type = data["type"]
      @size = data["size"]
      @main_location = data["main_location"] ? MainLocation.new(data["main_location"]) : nil
      @location = data["location"]
      @description = data["description"]
      @founded = data["founded"]
      @revenue = data["revenue"]
      @employees = data["employees"] ? CompanyEmployees.new(data["employees"]) : nil
      @website = data["website"]
      @phone = data["phone"]
      @email = data["email"]
      @social = data["social"] ? CompanySocial.new(data["social"]) : nil
      @technologies = data["technologies"]
      @subsidiaries = data["subsidiaries"]
      @headquarters = data["headquarters"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @zip_code = data["zip_code"]
      @address = data["address"]
    end
  end
  
  # Person location information
  class PersonLocation
    attr_accessor :country, :state, :city
    
    def initialize(data = {})
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
    end
  end
  
  # Person social media information
  class PersonSocial
    attr_accessor :linkedin_username, :linkedin_connections, :linkedin, :twitter, :facebook, :github
    
    def initialize(data = {})
      @linkedin_username = data["linkedin_username"]
      @linkedin_connections = data["linkedin_connections"]
      @linkedin = data["linkedin"]
      @twitter = data["twitter"]
      @facebook = data["facebook"]
      @github = data["github"]
    end
  end
  
  # Current job information
  class CurrentJob
    attr_accessor :title, :role, :level
    
    def initialize(data = {})
      @title = data["title"]
      @role = data["role"]
      @level = data["level"]
    end
  end
  
  # Person information model
  class Person
    attr_accessor :first_name, :last_name, :full_name, :logo, :overview, :experience,
                  :connections, :interests, :skills, :educations, :experiences,
                  :certifications, :company, :location, :current_job, :social
    
    def initialize(data = {})
      @first_name = data["first_name"]
      @last_name = data["last_name"]
      @full_name = data["full_name"]
      @logo = data["logo"]
      @overview = data["overview"]
      @experience = data["experience"]
      @connections = data["connections"]
      @interests = data["interests"]
      @skills = data["skills"]
      @educations = data["educations"]
      @experiences = data["experiences"]
      @certifications = data["certifications"]
      @company = data["company"] ? Company.new(data["company"]) : nil
      @location = data["location"] ? PersonLocation.new(data["location"]) : nil
      @current_job = data["current_job"] ? CurrentJob.new(data["current_job"]) : nil
      @social = data["social"] ? PersonSocial.new(data["social"]) : nil
    end
  end
  
  # Response types for each service
  class CufResponse < BaseResponse
    attr_accessor :domain
    
    def initialize(data = {})
      super(data)
      @domain = data["domain"]
    end
  end
  
  class LcufResponse < BaseResponse
    attr_accessor :linkedin_url
    
    def initialize(data = {})
      super(data)
      @linkedin_url = data["linkedin_url"]
    end
  end
  
  class DtcResponse < BaseResponse
    attr_accessor :company_name
    
    def initialize(data = {})
      super(data)
      @company_name = data["company_name"]
    end
  end
  
  class DteResponse < BaseResponse
    attr_accessor :emails
    
    def initialize(data = {})
      super(data)
      @emails = data["emails"] || []
    end
  end
  
  class NtpResponse < BaseResponse
    attr_accessor :phones
    
    def initialize(data = {})
      super(data)
      @phones = data["phones"] || []
    end
  end
  
  # REL Person
  class RelPerson
    attr_accessor :full_name, :first_name, :last_name, :linkedin_url, :summary,
                  :linkedin_followers, :facebook, :twitter, :avatar, :country,
                  :state, :city, :job_title, :job_title_categories, :company_name,
                  :company_linkedin, :company_website, :company_size, :company_industry,
                  :company_facebook, :company_twitter, :company_country, :company_state, :company_city
    
    def initialize(data = {})
      @full_name = data["full_name"]
      @first_name = data["first_name"]
      @last_name = data["last_name"]
      @linkedin_url = data["linkedin_url"]
      @summary = data["summary"]
      @linkedin_followers = data["linkedin_followers"]
      @facebook = data["facebook"]
      @twitter = data["twitter"]
      @avatar = data["avatar"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @job_title = data["job_title"]
      @job_title_categories = data["job_title_categories"]
      @company_name = data["company_name"]
      @company_linkedin = data["company_linkedin"]
      @company_website = data["company_website"]
      @company_size = data["company_size"]
      @company_industry = data["company_industry"]
      @company_facebook = data["company_facebook"]
      @company_twitter = data["company_twitter"]
      @company_country = data["company_country"]
      @company_state = data["company_state"]
      @company_city = data["company_city"]
    end
  end
  
  class RelResponse < BaseResponse
    attr_accessor :person
    
    def initialize(data = {})
      super(data)
      @person = data["person"] ? RelPerson.new(data["person"]) : nil
    end
  end
  
  # FCL Company
  class FclCompany
    attr_accessor :name, :website, :employee_count, :size, :industry, :description,
                  :linkedin_url, :domain, :country, :state, :city, :address,
                  :founded_year, :logo_url, :followers_count
    
    def initialize(data = {})
      @name = data["name"]
      @website = data["website"]
      @employee_count = data["employee_count"]
      @size = data["size"]
      @industry = data["industry"]
      @description = data["description"]
      @linkedin_url = data["linkedin_url"]
      @domain = data["domain"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @address = data["address"]
      @founded_year = data["founded_year"]
      @logo_url = data["logo_url"]
      @followers_count = data["followers_count"]
    end
  end
  
  class FclResponse < BaseResponse
    attr_accessor :companies
    
    def initialize(data = {})
      super(data)
      @companies = (data["companies"] || []).map { |c| FclCompany.new(c) }
    end
  end
  
  # ELF Fundraising
  class ElfFundraising
    attr_accessor :funding_last_round_type, :funding_ammount_currency_code,
                  :funding_money_raised, :funding_last_round_investors_url
    
    def initialize(data = {})
      @funding_last_round_type = data["funding_last_round_type"]
      @funding_ammount_currency_code = data["funding_ammount_currency_code"]
      @funding_money_raised = data["funding_money_raised"]
      @funding_last_round_investors_url = data["funding_last_round_investors_url"]
    end
  end
  
  class ElfResponse < BaseResponse
    attr_accessor :fundraising
    
    def initialize(data = {})
      super(data)
      @fundraising = data["fundraising_info"] ? ElfFundraising.new(data["fundraising_info"]) : nil
    end
  end
  
  class CarResponse < BaseResponse
    attr_accessor :revenue
    
    def initialize(data = {})
      super(data)
      @revenue = data["annual_revenue"]
    end
  end
  
  class FccResponse < BaseResponse
    attr_accessor :subsidiaries
    
    def initialize(data = {})
      super(data)
      @subsidiaries = data["subsidiaries"] || []
    end
  end
  
  class FtsResponse < BaseResponse
    attr_accessor :technologies
    
    def initialize(data = {})
      super(data)
      @technologies = data["technologies"] || []
    end
  end
  
  # EPP Person
  class EppPerson
    attr_accessor :full_name, :first_name, :last_name, :linkedin_url, :summary,
                  :linkedin_followers, :facebook, :twitter, :avatar, :country,
                  :state, :city, :job_title, :job_title_categories, :company_name,
                  :company_linkedin, :company_website, :company_size, :company_industry,
                  :company_facebook, :company_twitter, :company_country, :company_state, :company_city
    
    def initialize(data = {})
      @full_name = data["full_name"]
      @first_name = data["first_name"]
      @last_name = data["last_name"]
      @linkedin_url = data["linkedin_url"]
      @summary = data["summary"]
      @linkedin_followers = data["linkedin_followers"]
      @facebook = data["facebook"]
      @twitter = data["twitter"]
      @avatar = data["avatar"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @job_title = data["job_title"]
      @job_title_categories = data["job_title_categories"]
      @company_name = data["company_name"]
      @company_linkedin = data["company_linkedin"]
      @company_website = data["company_website"]
      @company_size = data["company_size"]
      @company_industry = data["company_industry"]
      @company_facebook = data["company_facebook"]
      @company_twitter = data["company_twitter"]
      @company_country = data["company_country"]
      @company_state = data["company_state"]
      @company_city = data["company_city"]
    end
  end
  
  class EppResponse < BaseResponse
    attr_accessor :person
    
    def initialize(data = {})
      super(data)
      @person = data["person"] ? EppPerson.new(data["person"]) : nil
    end
  end
  
  class FweResponse < BaseResponse
    attr_accessor :email
    
    def initialize(data = {})
      super(data)
      @email = data["work_email"]
    end
  end
  
  # TEP Person
  class TepPerson
    attr_accessor :full_name, :first_name, :last_name, :linkedin_url, :summary,
                  :linkedin_followers, :facebook, :twitter, :avatar, :country,
                  :state, :city, :job_title, :job_title_categories, :company_name,
                  :company_linkedin, :company_website, :company_size, :company_industry,
                  :company_facebook, :company_twitter, :company_country, :company_state,
                  :company_city, :email, :phone
    
    def initialize(data = {})
      @full_name = data["full_name"]
      @first_name = data["first_name"]
      @last_name = data["last_name"]
      @linkedin_url = data["linkedin_url"]
      @summary = data["summary"]
      @linkedin_followers = data["linkedin_followers"]
      @facebook = data["facebook"]
      @twitter = data["twitter"]
      @avatar = data["avatar"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @job_title = data["job_title"]
      @job_title_categories = data["job_title_categories"]
      @company_name = data["company_name"]
      @company_linkedin = data["company_linkedin"]
      @company_website = data["company_website"]
      @company_size = data["company_size"]
      @company_industry = data["company_industry"]
      @company_facebook = data["company_facebook"]
      @company_twitter = data["company_twitter"]
      @company_country = data["company_country"]
      @company_state = data["company_state"]
      @company_city = data["company_city"]
      @email = data["email"]
      @phone = data["phone"]
    end
  end
  
  class TepResponse < BaseResponse
    attr_accessor :person
    
    def initialize(data = {})
      super(data)
      @person = data["person"] ? TepPerson.new(data["person"]) : nil
    end
  end
  
  # ENC Company
  class EncCompany
    attr_accessor :name, :website, :employee_count, :industry, :size, :description,
                  :linkedin_url, :type, :domain, :country, :state, :city, :address,
                  :founded_year, :logo_url, :followers_count
    
    def initialize(data = {})
      @name = data["name"]
      @website = data["website"]
      @employee_count = data["employee_count"]
      @industry = data["industry"]
      @size = data["size"]
      @description = data["description"]
      @linkedin_url = data["linkedin_url"]
      @type = data["type"]
      @domain = data["domain"]
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @address = data["address"]
      @founded_year = data["founded_year"]
      @logo_url = data["logo_url"]
      @followers_count = data["followers_count"]
    end
  end
  
  class EncResponse < BaseResponse
    attr_accessor :company
    
    def initialize(data = {})
      super(data)
      @company = data["company"] ? EncCompany.new(data["company"]) : nil
    end
  end
  
  class CecResponse < BaseResponse
    attr_accessor :countries
    
    def initialize(data = {})
      super(data)
      @countries = data["countries"]
    end
  end
  
  # CLO Location
  class CloLocation
    attr_accessor :country, :state, :city, :postal_code, :line1, :line2, :latitude, :longitude
    
    def initialize(data = {})
      @country = data["country"]
      @state = data["state"]
      @city = data["city"]
      @postal_code = data["postal_code"]
      @line1 = data["line1"]
      @line2 = data["line2"]
      @latitude = data["latitude"]
      @longitude = data["longitude"]
    end
  end
  
  class CloResponse < BaseResponse
    attr_accessor :locations
    
    def initialize(data = {})
      super(data)
      @locations = (data["locations"] || []).map { |l| CloLocation.new(l) }
    end
  end
  
  class CseResponse < BaseResponse
    attr_accessor :companies
    
    def initialize(data = {})
      super(data)
      @companies = (data["companies"] || []).map { |c| Company.new(c) }
    end
  end
  
  class PseResponse < BaseResponse
    attr_accessor :peoples
    
    def initialize(data = {})
      super(data)
      @peoples = (data["peoples"] || []).map { |p| Person.new(p) }
    end
  end
  
  class LbsResponse < BaseResponse
    attr_accessor :companies
    
    def initialize(data = {})
      super(data)
      @companies = (data["companies"] || []).map { |c| Company.new(c) }
    end
  end
end
