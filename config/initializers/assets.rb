Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
  Rails.application.config.assets.paths << path
  Rails.application.config.assets.paths << Rails.root.join("app", "assets", "images", "players")
  Rails.application.config.assets.paths << Rails.root.join("app", "assets", "images", "players", "height_22")
end