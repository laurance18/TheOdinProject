require 'pry-byebug'

puts 'Event Manager initialized!'

contents = File.read("event_attendees.csv")
puts contents