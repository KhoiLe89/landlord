require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging


ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end


binding.pry
puts "hi"
