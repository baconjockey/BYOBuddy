class PairingsController < ApplicationController
  # GET /pairings
  # GET /pairings.json
  def index
    @pairings = Pairing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pairings }
    end
  end

  # GET /pairings/1
  # GET /pairings/1.json
  def show
    @pairing = Pairing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pairing }
    end
  end

  # GET /pairings/new
  # GET /pairings/new.json
  def new
    @pairing = Pairing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pairing }
    end
  end

  # GET /pairings/1/edit
  def edit
    @pairing = Pairing.find(params[:id])
  end

  # POST /pairings
  # POST /pairings.json
  def create
    @pairing = Pairing.new(params[:pairing])

    respond_to do |format|
      if @pairing.save
        format.html { redirect_to @pairing, notice: 'Pairing was successfully created.' }
        format.json { render json: @pairing, status: :created, location: @pairing }
      else
        format.html { render action: "new" }
        format.json { render json: @pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pairings/1
  # PUT /pairings/1.json
  def update
    @pairing = Pairing.find(params[:id])

    respond_to do |format|
      if @pairing.update_attributes(params[:pairing])
        format.html { redirect_to @pairing, notice: 'Pairing was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairings/1
  # DELETE /pairings/1.json
  def destroy
    @pairing = Pairing.find(params[:id])
    @pairing.destroy

    respond_to do |format|
      format.html { redirect_to pairings_url }
      format.json { head :ok }
    end
  end
end
