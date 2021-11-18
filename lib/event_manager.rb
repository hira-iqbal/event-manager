# puts 'event manager initialized!'

# contents = File.read('event_attendees.csv')
# puts contents display all the content in file

# lines.each do |line|

  #next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n" remove the  header of columns
  #its second way is to track the index of current line


lines = File.readlines('event_attendees.csv')
row_index = 0
lines.each do |line|
  row_index = row_index + 1
  next if row_index == 1
  columns = line.split(",")
  name = columns[2]
  lname = columns[3]
  email = columns[4]
  puts name
  puts lname
  puts email
end
# puts 'EventManager initialized.'

# lines = File.readlines('event_attendees.csv')
# lines.each_with_index do |line,index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

