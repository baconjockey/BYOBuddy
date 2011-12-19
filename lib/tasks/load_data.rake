require 'csv'

namespace :data do

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
                        :description       => row[3],
                        :sample_brands     => row[4],
                        :image             => row[5])
      rescue Exception => e
        failures << row
      end
    end

    total_time = Time.now - start_time
    puts "Elapsed time #{total_time} seconds."
    puts "Failed to add #{failures.count} styles"
    puts failures.inspect
  end
  
  
  desc "Load PairingDescriptors"
  task :load_pairing_descriptors => :environment do
    
    PairingDescriptor.destroy_all
    start_time = Time.now
    filename = File.join(Rails.root, '/db/seeds/PairingDescriptors.csv')
    failures = []
  
    CSV.foreach(filename, :headers => true) do |row|
      begin
        PairingDescriptor.create!(:name         => row[0],
                                  :category     => Category.find_by_name(row[1]))
      rescue Exception => e
        failures << row
      end
    end
  
    total_time = Time.now - start_time
    puts "Elapsed time #{total_time} seconds."
    puts "Failed to add #{failures.count} styles"
    puts failures.inspect
  end
  
  desc "Load Pairings"
  task :load_pairings => :environment do
    
    Pairing.destroy_all
    start_time = Time.now
    filename = File.join(Rails.root, '/db/seeds/Pairings.csv')
    failures = []
  
    CSV.foreach(filename, :headers => true) do |row|
      begin
        Pairing.create!(:beer_style             => BeerStyle.find_by_name(row[0]),
                        :pairing_descriptor     => PairingDescriptor.find_by_name(row[1]),
                        :reasoning              => row[2])
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