require 'csv'
require_relative '../app/models/legislator'

module CleanDataFields
  def self.remove_unwanted_fields(hash_to_clean)
    hash_to_clean.delete_if { |key, value| unwanted_fields.include?(key) }
  end

  def self.unwanted_fields
    [ :nickname,
      :district, 
      :congress_office, 
      :bioguide_id, 
      :votesmart_id, 
      :fec_id, 
      :govtrack_id,
      :crp_id, 
      :official_rss, 
      :senate_class, 
      :congresspedia_url, 
      :youtube_url,
      :facebook_id]
  end
end

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      attributes = Hash.new
      row.each do |field, value|
        attributes.merge!( { field.to_sym => value } )
        # raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
      end
      attributes = CleanDataFields.remove_unwanted_fields(attributes)
      Legislator.create(attributes)
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
