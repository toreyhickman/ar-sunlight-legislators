require_relative '../../db/config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |legislator|
      legislator.integer :id
      legislator.string :title
      legislator.string :firstname
      legislator.string :middlename
      legislator.string :lastname
      legislator.string :name_suffix
      legislator.string :party
      legislator.string :state
      legislator.string :in_office
      legislator.string :gender
      legislator.string :phone
      legislator.string :fax
      legislator.string :website
      legislator.string :webform
      legislator.string :twitter_id
      legislator.string :birthdate
    end
  end
end

















