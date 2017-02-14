module PlayersHelper

  def player_image player, css = "player"
    image_tag(player.image.to_s, class: css) if player.image
  end

  def player_image_22 player
    image_tag('players/height_22/'+player.image.to_s).html_safe
  end

  def player_price price
    number_with_delimiter(price, delimiter: ".")
  end
end