task :update_image_locally => :environment do
	Player.all.each do |p|
		image_url = p.image
		if image_url
			image_name_url = image_url.split('/')
			p.image = image_name_url[image_name_url.length-1]
			p.save!
		end
	end

end