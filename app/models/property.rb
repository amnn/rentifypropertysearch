class Property < ActiveRecord::Base
  attr_accessible :bedroom_count, :latitude, :longitude, :name

  def self.search query

    Property.where( "name LIKE ?", "%#{ query }%" )

  end

end
