require 'pry-byebug'
require 'csv'

puts 'Event Manager initialized!'

contents = CSV.read(File.expand_path("../event_attendees.csv", __dir__))
print contents

