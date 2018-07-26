class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  # GET /fights
  # GET /fights.json
  def index
    @fights = Fight.all
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
    @fighters = Fighter.all
  end

  # POST /fights
  # POST /fights.json
  def create
    # @fight = Fight.new(fight_params)

    # respond_to do |format|
    #   if @fight.save
    #     format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
    #     format.json { render :show, status: :created, location: @fight }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @fight.errors, status: :unprocessable_entity }
    #   end
    # end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fight_params
      params.require(:fight).permit(:winner, :loser)
    end
end
