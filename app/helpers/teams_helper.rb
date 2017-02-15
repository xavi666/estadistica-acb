module TeamsHelper

  def team_image team, css = "team"
    if team and team.short_code
      logical_path = 'teams/'+team.short_code+'.png'
      if asset_available? logical_path
        image_tag(logical_path, class: css).html_safe
      else
        image_tag('players/default.jpg', class: css).html_safe       
      end
    end
  end

  def team_image_22 team, css = "team"
    if team and team.short_code
      logical_path = 'teams/height_22/'+team.short_code+'.png'
      if asset_available? logical_path
        image_tag(logical_path, class: css).html_safe
      else
        image_tag('players/default.jpg', class: css).html_safe
      end
    end
  end
end