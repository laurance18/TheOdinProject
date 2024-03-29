require 'pry-byebug'
require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

personal_letter = File.read(File.expand_path("../form_letter.erb", __dir__))
erb_template = ERB.new personal_letter

def clean_zipcode(zipcode)
  zipcode.nil? ? zipcode = "00000" : zipcode.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thanks_letter(id, form_letter)
  Dir.mkdir(File.expand_path("../output", __dir__)) unless Dir.exist?(File.expand_path("../output", __dir__))

  filename = "#{File.expand_path("../output", __dir__)}/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(phone_number)
  phone_number.gsub!(/[^\d]/,'')
  if phone_number.length == 10
    phone_number
  elsif phone_number.length == 11 && phone_number[0] == "1"
    phone_number[1..10]
  else
    "Invalid phone number."
  end
end


print "Event Manager initialized!\n\n"
contents = CSV.open(
  File.expand_path("../event_attendees.csv", __dir__),
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = clean_phone_number(row[:homephone])

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  

  save_thanks_letter(id, form_letter)
end
