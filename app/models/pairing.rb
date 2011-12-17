class Pairing < ActiveRecord::Base
  belongs_to :beer_style
  belongs_to :pairing_descriptor
  
  
  def self.for_descriptor_ids(ids)
    all_possible_pairings = Pairing.where(:pairing_descriptor_id => ids).includes(:beer_style)
  
    beer_styles_by_pairing_descriptor = all_possible_pairings
        .group_by(&:pairing_descriptor_id)
        .map{|_, pairings| pairings.map(&:beer_style)}
    
    beer_styles_in_all_pairings = beer_styles_by_pairing_descriptor.inject(beer_styles_by_pairing_descriptor.first) do |beer_styles, candidates|
      beer_styles & candidates
    end
        
    all_possible_pairings
        .select { |pairing| beer_styles_in_all_pairings.include?(pairing.beer_style) }
  end
        
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
