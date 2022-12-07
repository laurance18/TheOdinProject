require 'pry-byebug'
require 'csv'

def clean_zipcode(zipcode)
  zipcode.rjust(5, '0')[0..4]
end

print "Event Manager initialized!\n\n"
content = CSV.open(
  File.expand_path("../event_attendees.csv", __dir__),
  headers: true,
  header_converters: :symbol
)

content.each do |row|
  name = row[:first_name].to_s
  zipcode = clean_zipcode(row[:zipcode].to_s)

  puts "#{name} #{zipcode}"
end

