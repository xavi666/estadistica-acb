class TeamsController < ApplicationController

  def index
    @teams = Team.active
  end

  def show
    
  end

  private
    def find_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit([:name, :second_name, :short_code, :active])
    end
end