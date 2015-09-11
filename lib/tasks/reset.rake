require 'csv'

namespace :reset do
	

	task :ownerships => :environment do 
		Ownership.all.each do |t|
		
      t.update_attribute :player_id, nil
    
		end
	end

	task :all => [:ownerships] do
	end
	
end

