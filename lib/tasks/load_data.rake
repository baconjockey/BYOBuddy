require 'csv'

namespace :data do

  # controller name
  desc "Load BeerStyles"
  task :load_beer_styles => :environment do
    BeerStyle.destroy_all
    start_time = Time.now
    filename = File.join(Rails.root, '/db/seeds/BeerStyle.csv')
    failures = []

    CSV.foreach(filename, :headers => true) do |row|
      begin
        # model name
        BeerStyle.create!(:name            => row[0],
                        :aka               => row[1],
                        :country_of_origin => row[2],
                        :sample_brands     => row[3],
                        :description       => row[4])
      rescue Exception => e
        failures << row
      end
    end

    total_time = Time.now - start_time
    puts "Elapsed time #{total_time} seconds."
    puts "Failed to add #{failures.count} styles"
    puts failures.inspect
  end
  
  
  desc "Load Cuisines"
  task :load_cuisines => :environment do
    
    
    c = Category.find_by_name(col_1)
    c.pairing_descriptors.build(name => "Seafood")
    
    PairingDescriptor.destroy_all
    start_time = Time.now
    filename = File.join(Rails.root, '/db/seeds/Cuisine.csv')
    failures = []

    CSV.foreach(filename, :headers => true) do |row|
      begin
        # model name
        PairingDescriptor.create!(:name        => row[0])
      rescue Exception => e
        failures << row
      end
    end

    total_time = Time.now - start_time
    puts "Elapsed time #{total_time} seconds."
    puts "Failed to add #{failures.count} styles"
    puts failures.inspect
  end
end

# to run locally: rake upload_data:load_foo where "foo" = task.  Here, rake upload_data:load_BeerStyles
# to run on heroku: heroku run rake upload_data:load_foo where "foo" = task