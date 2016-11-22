class TeamsController < ApplicationController

  def index
    @teams = Team.active

    # SEO
    @page_title       = t('.title', season: CURRENT_SEASON)
    @page_description = t('.description', season: CURRENT_SEASON)
    @page_keywords    = t('.keywords')
    # SEO
  end

  def show
    @team = Team.find(params[:id])

    # SEO
    @page_title       = t('.title', team: @team.name)
    @page_description = t('.description', team: @team.name, season: CURRENT_SEASON)
    @page_keywords    = t('.keywords', team: @team.name)
    # SEO
  end

  private
    def team_params
      params.require(:team).permit([:name, :second_name, :short_code, :rest_round_1, :rest_round_2, :active])
    end
end