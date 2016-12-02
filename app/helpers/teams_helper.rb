module TeamsHelper

  def team_image team, css = "team"
    image_tag('teams/'+team.short_code+'.jpg', class: css).html_safe if team and team.short_code
  end
end