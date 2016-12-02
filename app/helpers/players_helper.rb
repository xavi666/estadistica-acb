module PlayersHelper

  def player_image player, css = "player"
    image_tag(player.image.to_s, class: css) if player.image
  end

  def player_price price
    number_with_delimiter(price, delimiter: ".")
  end
end