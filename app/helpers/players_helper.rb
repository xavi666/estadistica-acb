module PlayersHelper

  def player_image player, css = "player"
    image_tag(player.image.to_s, class: css) if player.image
  end

  def player_image_22 player
  	image_tag(image_url('/assets/players/height_22/'+player.image.to_s))
  end

  def player_price price
    number_with_delimiter(price, delimiter: ".")
  end
end