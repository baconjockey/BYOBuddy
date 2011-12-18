class RecommendationsController < ApplicationController
  def new
  end

  def create
      render :new if params[:pairing_descriptors] == nil
      
      requested_pairing_ids = params[:pairing_descriptors]
      @pairings = Pairing.for_descriptor_ids(requested_pairing_ids)

      
       #  
       # if params[:pairing_descriptors]!=nil
       #   requested_pairing_ids = params[:pairing_descriptors]
       #   # ActiveRecord::Relation object containing all candidate beer pairings, including reasoning
       #   candidate_pairing_reasoning = Pairing.where(:pairing_descriptor_id => requested_pairing_ids)
       #   # get unique candidate pairings based on pairing_ids
       #   candidate_pairings  = candidate_pairing_reasoning.group(:beer_style_id)
       #   # candidates pairings but in their equivalent beer style
       #   candidates = candidate_pairings.map(&:beer_style) 
       #   @beer_styles = candidates.select do |candidate| 
       #     requested_pairing_ids.all? { |rp| candidate.pairing_descriptors.find_by_id(rp) } 
       #   end
       # 
       #   @reasoning = candidate_pairing_reasoning.select { |x| x if @beer_styles.map(&:id).include?(x.beer_style_id) } 
       # else
       #   render :new
       # end

  end
  
end
