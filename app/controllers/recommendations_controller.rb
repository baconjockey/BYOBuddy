class RecommendationsController < ApplicationController
  def new
  end

  def create
    pairings = Pairing.scoped
    
    # create new array from params hash values
    # for each element in the array, run the pairings search
    # save the results of each pairings search in a new array
    # compare arrays with "&" intersection operator
    
    # @c = params[:pairing_descriptors].flatten.count
    
    params[:pairing_descriptors].each do |descriptor_id|
      pairings = pairings.where(:pairing_descriptor_id => descriptor_id)
    end
    
    @beer_styles = pairings.map { |pairing| pairing.beer_style }.uniq
    
  end

end
