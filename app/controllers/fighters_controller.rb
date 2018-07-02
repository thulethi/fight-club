class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]

  # GET /fighters
  # GET /fighters.json
  def index
    @fighters = Fighter.all
  end

  # GET /fighters/1
  # GET /fighters/1.json
  def show
  end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/newfight
  def newfight
    @fighters = Fighter.all
    render "fighters/newfight"
  end

  # POST /fighters/newfight
  def newfight_result
    @fighters = Fighter.all
    @fighter1id = params[:fighter1][:id]
    @fighter2id = params[:fighter2][:id]
    @fighter1 = Fighter.find(@fighter1id)
    @fighter2 = Fighter.find(@fighter2id)
    @fight_winner = pick_winner(@fighter1, @fighter2)
    render "fighters/newfight"
  end

  def pick_winner(fighter1, fighter2)
    winner = 
      if fighter1.strength >= fighter2.strength
        fighter1
      else
        fighter2
      end
    return winner
  end

  # GET /fighters/1/edit
  def edit
  end

  # POST /fighters
  # POST /fighters.json
  def create
    @fighter = Fighter.new(fighter_params)

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: 'Fighter was successfully created.' }
        format.json { render :show, status: :created, location: @fighter }
      else
        format.html { render :new }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fighters/1
  # PATCH/PUT /fighters/1.json
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully updated.' }
        format.json { render :show, status: :ok, location: @fighter }
      else
        format.html { render :edit }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params
      params.require(:fighter).permit(:name, :strength, :picture)
    end
end
