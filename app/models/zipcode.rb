class Zipcode < ActiveRecord::Base
	belongs_to :user

# ##########################################
# FROM A TUTORIAL AT  http://www.jorgecoca.com/buils-search-form-ruby-rails/

  # attr_accessible :zip
 
  validates :zip, presence: true, uniqueness: true
 
  # It returns the zipcodes whose zips contain one or more words that form the query
  def self.search(query)
    # where(:zip, query) -> This would return an exact match of the query
    where("zip like ?", "%#{query}%") 
  end

  # ########################################

end
