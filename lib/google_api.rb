# require 'csv'
# require 'google/apis/civicinfo_v2'

# civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
# civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,'0')[0..4]
# end
# p '***************  event manager initialized   ******************'
# content= CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
# content.each do |row|
#   name = row[:first_name]
#   zipcode = clean_zipcode(row[:zipcode])

#   begin
#   legislators = civic_info.representative_info_by_address(address: zipcode,
#     levels: 'country',
#     roles: ['legislatorUpperBody', 'legislatorLowerBody'])
#   legislators = legislators.officials
#   rescue
#    'you can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end
#   puts "#{name} #{zipcode} #{legislators}"
# end
# cleanly displaying names of legislators using map function
require 'csv'
require 'google/apis/civicinfo_v2'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new

 civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'


   begin
    legislators = civic_info.representative_info_by_address(address: zipcode,
    levels: 'country',
    roles: ['legislatorUpperBody', 'legislatorLowerBody'])
   legislators = legislators.officials
   legislators_string = legislator.map(&:name)
   legislators_string = legislator_names.join(",")
   rescue
   'you can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
end

