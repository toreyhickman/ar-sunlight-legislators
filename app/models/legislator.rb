require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.list_by_state(state)
    list_of_legislators = ""
    list_of_legislators << add_senators(state)
    list_of_legislators << add_reps(state)
    list_of_legislators
  end

  def self.add_senators(state)
    list_of_senators = "Senators:"
    senators = Legislator.where("state = ? AND title = ? AND in_office = ?", state, 'Sen', "1")    
    senators.each do |senator|
      list_of_senators << "\n  #{senator.name} (#{senator.party})"
    end
    list_of_senators
  end

  def self.add_reps(state)
    list_of_reps = "\nRepresentatives:"
    reps = Legislator.where("state = ? AND title = ?", state, 'Rep')
    reps.each do |rep|
      list_of_reps << "\n  #{rep.name} (#{rep.party})"
    end
    list_of_reps
  end

  def name
    names_combined = "#{self.title} #{self.firstname}"
    names_combined << " #{middlename}" unless middlename == ""
    names_combined << " #{lastname}"
    names_combined << ", #{name_suffix}" unless name_suffix == ""
    names_combined
  end


end
