class BeerStylesController < ApplicationController
  # GET /beer_styles
  # GET /beer_styles.json
  def index
    @beer_styles = BeerStyle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beer_styles }
    end
  end

  # GET /beer_styles/1
  # GET /beer_styles/1.json
  def show
    @beer_style = BeerStyle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beer_style }
    end
  end

  # GET /beer_styles/new
  # GET /beer_styles/new.json
  def new
    @beer_style = BeerStyle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @beer_style }
    end
  end

  # GET /beer_styles/1/edit
  def edit
    @beer_style = BeerStyle.find(params[:id])
  end

  # POST /beer_styles
  # POST /beer_styles.json
  def create
    @beer_style = BeerStyle.new(params[:beer_style])

    respond_to do |format|
      if @beer_style.save
        format.html { redirect_to @beer_style, notice: 'Beer style was successfully created.' }
        format.json { render json: @beer_style, status: :created, location: @beer_style }
      else
        format.html { render action: "new" }
        format.json { render json: @beer_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /beer_styles/1
  # PUT /beer_styles/1.json
  def update
    @beer_style = BeerStyle.find(params[:id])

    respond_to do |format|
      if @beer_style.update_attributes(params[:beer_style])
        format.html { redirect_to @beer_style, notice: 'Beer style was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @beer_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beer_styles/1
  # DELETE /beer_styles/1.json
  def destroy
    @beer_style = BeerStyle.find(params[:id])
    @beer_style.destroy

    respond_to do |format|
      format.html { redirect_to beer_styles_url }
      format.json { head :ok }
    end
  end
end
