task :update_image_locally => :environment do
	Player.all.each do |p|
		image_url = p.image
		if image_url
			p.image = image_url.gsub! '.jpg', '.png'
			p.save!
		end
	end

end