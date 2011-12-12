class RecommendationsController < ApplicationController
  def new
  end

  def create
    pairings = Pairing.scoped
    
    
    requested_pairing_ids = params[:pairing_descriptors]
    candidate_pairings  = Pairing.where(:pairing_descriptor_id => requested_pairing_ids).group(:beer_style_id)
    candidates = candidate_pairings.map(&:beer_style)
    @beer_styles = candidates.select { |candidate| requested_pairing_ids.all? { |rp| candidate.pairing_descriptors.find_by_id(rp) } }
      
    # params[:pairing_descriptors].each do |descriptor_id|  
      #pairings = pairings.where(:pairing_descriptor_id => descriptor_id)
    # end
    # @beer_styles = pairings.map { |pairing| pairing.beer_style }.uniq
    
  end

end
