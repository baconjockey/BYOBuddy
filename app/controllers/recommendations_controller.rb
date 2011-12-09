class RecommendationsController < ApplicationController
  def new
  end

  def create
    pairings = Pairing.scoped
    
    params[:pairing_descriptors].each do |descriptor_id|
      pairings = pairings.where(:pairing_descriptor_id => descriptor_id)
    end
    
    @beer_styles = pairings.map { |pairing| pairing.beer_style }.uniq
    
  end

end
