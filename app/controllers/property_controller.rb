class PropertyController < ApplicationController
  include PropertyHelper

  # GET /
  def index

    @properties = Property.all

  end

  # GET /property/:id
  def property

    @property = Property.find(                          params[ :id ] ) 
    @similar  = Property.where(   "bedroom_count >= ? AND NOT id = ?", 
                                @property.bedroom_count, @property.id )
    
    @similar.select!  { |prop| distance( @property, prop ) <= 20.0 }
    @similar.sort_by! { |prop| distance( @property, prop ) }

  end

end
