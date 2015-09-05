require 'csv'



	task :teams => :environment do 
		teams = CSV.new(File.open(Rails.root.join("teams.csv")), headers: true)

		teams.each do |team|
			Team.create!(name: team[0].strip, division: team[1])
		end
	end

