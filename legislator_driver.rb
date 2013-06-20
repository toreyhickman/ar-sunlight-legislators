require_relative 'db/config'
require_relative 'app/models/legislator'


puts Legislator.list_by_state("OH")
puts
puts Legislator.gender_count_and_percent("F")
puts
puts Legislator.list_count_by_state
puts
Legislator.delete_all(["in_office = ?", "0"])
puts "Senators: #{Legislator.where("title = ?", "Sen").count}"
puts "Representatives: #{Legislator.where("title = ?", "Rep").count}"
