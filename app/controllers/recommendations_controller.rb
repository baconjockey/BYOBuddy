class RecommendationsController < ApplicationController
  def new
  end

  def create
    
    if params[:pairing_descriptors]!=nil
      requested_pairing_ids = params[:pairing_descriptors]
      # ActiveRecord::Relation object containing all candidate beer pairings, including reasoning
      candidate_pairing_reasoning = Pairing.where(:pairing_descriptor_id => requested_pairing_ids)
      # get unique candidate pairings based on pairing_ids
      candidate_pairings  = candidate_pairing_reasoning.group(:beer_style_id)
      # candidates pairings but in their equivalent beer style
      candidates = candidate_pairings.map(&:beer_style) 
      @beer_styles = candidates.select do |candidate| 
        requested_pairing_ids.all? { |rp| candidate.pairing_descriptors.find_by_id(rp) } 
      end
    
      @reasoning = candidate_pairing_reasoning.select { |x| x if @beer_styles.map(&:id).include?(x.beer_style_id) } 
    else
      render :new
    end
    
    # @display_reasoning = []
    #    
    #    candidate_pairing_reasoning.each do |candidate|
    #      if candidate.beer_style_id = @beer_style.each.beer_style_id
    #        @display_reasoning << candidate.reasoning
    #      else
    #        @display_reasoning
    #      end
    #    end
    #    
    # if cpr.bs_id = beer_style then display_reasoning << cpr 
    # display_reasoning.each display_reasoning.reasoning
      
    
    # ok, beer_styles + requested_pairing_ids = candidate_pairing_reasoning
      # display_reasoning = empty array
      # candidate_pairing_reasoning.each do 
      # if cpr.bs_id = beer_style then display_reasoning << cpr 
      # display_reasoning.each display_reasoning.reasoning
    # raise @candidate_pairings.inspect

 
    # params[:pairing_descriptors].each do |descriptor_id|  
      #pairings = pairings.where(:pairing_descriptor_id => descriptor_id)
    # end
    # @beer_styles = pairings.map { |pairing| pairing.beer_style }.uniq
  end
  
end
