class Artist < ActiveRecord::Base
	# has_many :zipcodes, :dependent => :destroy

# ##########################################
# FROM A TUTORIAL AT  http://www.jorgecoca.com/buils-search-form-ruby-rails/

  # attr_accessible :zip
 
  validates :first, presence: true, uniqueness: true
 
  # It returns the zipcodes whose zips contain one or more words that form the query
  def self.search(query)
    # where(:zip, query) -> This would return an exact match of the query
    where("first like ?", "%#{query}%")

  end

  # ########################################

end
