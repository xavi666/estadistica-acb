module TeamsHelper

  def team_image team, css = "team"
    image_tag('teams/'+team.short_code+'.png', class: css).html_safe if team and team.short_code
  end

  def team_image_22 team
    image_tag('teams/height_22/'+team.short_code+'.png').html_safe if team and team.short_code
  end
end