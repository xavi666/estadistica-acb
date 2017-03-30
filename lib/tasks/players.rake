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

task :update_full_name => :environment do
	Player.all.each do |p|
		s_name = p.name.split(",")
		p.full_name = s_name[1].gsub! + " " + s_name[0]
		p.save
	end
end