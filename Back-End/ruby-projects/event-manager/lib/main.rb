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

print "Event Manager initialized!\n\n"
contents = CSV.open(
  File.expand_path("../event_attendees.csv", __dir__),
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  Dir.mkdir(File.expand_path("../output", __dir__)) unless Dir.exist?(File.expand_path("../output", __dir__))

  filename = "#{File.expand_path("../output", __dir__)}/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end

end

