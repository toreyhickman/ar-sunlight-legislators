require_relative 'db/config'
require_relative 'app/models/legislator'


puts Legislator.list_by_state("OH")
