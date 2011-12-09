require 'csv'
# require 'net/ftp'

namespace :data do

  # controller name
  desc "Load BeerStyles"
  task :load_beer_styles => :environment do
 
    start_time = Time.now
    # ftp = Net::FTP.new('ftp.drivehq.com')
    # ftp.login(user = "user", passwd = "passwd")
    # ftp.passive = true
    # ftp.get("BeerStyleTest.csv", File.basename( "/data/BeerStyleTest.csv"))
    # ftp.quit()
    filename = File.join(Rails.root, '/db/seeds/BeerStyleTest.csv')
    successes = []
    failures = []

    CSV.foreach(filename, :headers => true) do |row|
      begin
        # model name
        BeerStyle.create!(:name            => row[0],
                        :aka               => row[1],
                        :country_of_origin => row[2],
                        :sample_brands     => row[3])
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