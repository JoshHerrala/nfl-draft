require 'csv'

namespace :importcsv do
	task :players => :environment do
		players = CSV.new(File.open(Rails.root.join("players.csv")), headers: true)

		players.each do |player|
			Player.create!(name: player[0].strip, position: player[1])
		end
	end

	task :teams => :environment do 
		teams = CSV.new(File.open(Rails.root.join("teams.csv")), headers: true)

		teams.each do |team|
			Team.create!(name: team[0].strip, division: team[1])
		end
	end
  

	task :ownerships => [:teams] do 
		ownerships = CSV.new(File.open(Rails.root.join("order.csv")), headers: true)

		ownerships.each do |ownership|
      if ownership[2] == "NY Giants"
      				ownership[2] = "New York Giants"
      			elsif ownership[2] == "NY Jets"
      				ownership[2] = "New York Jets"
      			end
			
        team = Team.find_by(name: ownership[2].strip)
			Ownership.create!(round: ownership[0], pick: ownership[1], team_id: team.id)
		end
	end

	task :all => [:players, :teams, :logos, :ownerships] do
	end
	
end
