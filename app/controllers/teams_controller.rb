class TeamsController < ApplicationController

  def index
    @teams = Team.active
  end

  def show
    @team = Team.find(params[:id])
  end

  private
    def team_params
      params.require(:team).permit([:name, :second_name, :short_code, :active])
    end
end