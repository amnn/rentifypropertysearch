class PropertyController < ApplicationController
  include PropertyHelper

  # GET /
  # POST / (:query)
  def index

    @properties = Property.search( params[:query] || "" )

    respond_to do |format|

      format.html
      format.json { render json: @properties }

    end

  end

  # GET /property/:id
  def property

    @property = Property.find(                          params[ :id ] ) 
    @similar  = Property.where(   "bedroom_count >= ? AND NOT id = ?", 
                                @property.bedroom_count, @property.id )
    
    @similar.select!  { |prop| distance( @property, prop ) <= 20.0 }
    @similar.sort_by! { |prop| distance( @property, prop ) }

    respond_to do |format|

      format.html
      format.json { render json: { property: @property, similar: @similar } }

    end

  end

end
