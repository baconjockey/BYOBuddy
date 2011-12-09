class PairingDescriptorsController < ApplicationController
  # GET /pairing_descriptors
  # GET /pairing_descriptors.json
  def index
    @pairing_descriptors = PairingDescriptor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pairing_descriptors }
    end
  end

  # GET /pairing_descriptors/1
  # GET /pairing_descriptors/1.json
  def show
    @pairing_descriptor = PairingDescriptor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pairing_descriptor }
    end
  end

  # GET /pairing_descriptors/new
  # GET /pairing_descriptors/new.json
  def new
    @pairing_descriptor = PairingDescriptor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pairing_descriptor }
    end
  end

  # GET /pairing_descriptors/1/edit
  def edit
    @pairing_descriptor = PairingDescriptor.find(params[:id])
  end

  # POST /pairing_descriptors
  # POST /pairing_descriptors.json
  def create
    @pairing_descriptor = PairingDescriptor.new(params[:pairing_descriptor])

    respond_to do |format|
      if @pairing_descriptor.save
        format.html { redirect_to @pairing_descriptor, notice: 'Pairing descriptor was successfully created.' }
        format.json { render json: @pairing_descriptor, status: :created, location: @pairing_descriptor }
      else
        format.html { render action: "new" }
        format.json { render json: @pairing_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pairing_descriptors/1
  # PUT /pairing_descriptors/1.json
  def update
    @pairing_descriptor = PairingDescriptor.find(params[:id])

    respond_to do |format|
      if @pairing_descriptor.update_attributes(params[:pairing_descriptor])
        format.html { redirect_to @pairing_descriptor, notice: 'Pairing descriptor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pairing_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairing_descriptors/1
  # DELETE /pairing_descriptors/1.json
  def destroy
    @pairing_descriptor = PairingDescriptor.find(params[:id])
    @pairing_descriptor.destroy

    respond_to do |format|
      format.html { redirect_to pairing_descriptors_url }
      format.json { head :ok }
    end
  end
end
