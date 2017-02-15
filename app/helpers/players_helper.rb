module PlayersHelper

  def player_image player, css = "player"
    if player.image
      logical_path = 'players/original/'+player.image.to_s
      if Player.asset_available? logical_path
        image_tag('players/original/'+player.image.to_s, class: css).html_safe if player.image
      else
        image_tag('players/default.jpg', class: css).html_safe if player.image        
      end
    end
  end

  def player_image_22 player, css = "player"
    if player.image
      if Rails.application.assets.find_asset('players/height_22/'+player.image.to_s) != nil
        image_tag('players/height_22/'+player.image.to_s, class: css).html_safe 
      else
        image_tag('players/default.jpg', class: css).html_safe if player.image
      end
    end
  end

  def player_price price
    number_with_delimiter(price, delimiter: ".")
  end
end