require 'pry-byebug'
require 'csv'
require 'google/apis/civicinfo_v2'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

template_letter = File.read('form_letter.html')

def clean_zipcode(zipcode)
  zipcode.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    )
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislator_names.join(", ")
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
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
  legislators = legislators_by_zipcode(zipcode)

  personal_letter.gsub!('FIRST_NAME', name)
  personal_letter.gsub!('LEGISLATORS', legislators)

  puts "#{name} #{zipcode} #{legislators}"
end

