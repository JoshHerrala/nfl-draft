require 'csv'


	task :players => :environment do
		players = CSV.new(File.open(Rails.root.join("players.csv")), headers: true)

		players.each do |player|
			Player.create!(name: player[0].strip, position: player[2])
		end
	end

	
	
