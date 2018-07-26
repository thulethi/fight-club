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
    @fighters = Fighter.all
    fighter1id = params[:fighter1][:id]
    fighter2id = params[:fighter2][:id]
    @fighter1 = Fighter.find(fighter1id)
    @fighter2 = Fighter.find(fighter2id)
    @fight_winner, @fight_loser = resolve_fight(@fighter1, @fighter2)

    @fight = Fight.new
    @fight.winner = @fight_winner
    @fight.loser = @fight_loser
    @fight.save!

    render "fights/new"
  end

  # def resolve_fight(fighter1, fighter2)
  #   if fighter1.strength >= fighter2.strength
  #     return fighter1, fighter2
  #   else
  #     return fighter2, fighter1
  #   end
  # end

  def resolve_fight(fighter1, fighter2)
    sum_strength = fighter1.strength + fighter2.strength
    r = rand(sum_strength)
    if r < fighter1.strength
      return fighter1, fighter2
    else
      return fighter2, fighter1
    end
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
