### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

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

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
tenant1 = Tenant.find(1)
# get all tenants older than 65
old_tenant = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
exp_apartments = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_tenant = damien.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
name_id = Tenant.all.each do |tenant|
  puts tenant.name
  puts tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
apartment_price_address = Apartment.all.each do |apartment|
  p apartment.address
  p apartment.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  a_tenant = apartment.tenants.each do |tenant|
  p a_tenant
  p apartment.address
end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

first_new = Apartment.new(address: "1 main street", monthly_rent: )
second_new = Apartment.new(address: "2 main street" monthly_rent: )
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

binding.pry
puts "hi"
