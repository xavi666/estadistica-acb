task :update_image_locally => :environment do
	Player.all.each do |p|
		image_url = p.image
		if image_url and !image_url.blank?
			image = image_url.split("/").last
			p.image = image.gsub! '.jpg', '.png'
			p.save!
		end
	end
end