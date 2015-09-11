require 'csv'

namespace :draft do
	
  foo = 1
	task :ownerships => :environment do 
		Ownership.all.each do |t|
		
      t.update_attribute :player_id, foo
      foo = foo + 1
		end
	end

	task :all => [:ownerships] do
	end
	
end

