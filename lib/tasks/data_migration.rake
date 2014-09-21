namespace :migrate do

  desc 'copy all data to csv'
  task dump_parks_to_csv: :environment do
    
    CSV.open('./parks.csv', 'wb') do |csv|
      Park.all.each do |park|
        park_attrs = [
                      park.name,
                      park.city,
                      park.state,
                      park.country,
                      park.latitude,
                      park.longitude,
                      park.description
                      ]
        csv << park_attrs
      end
    end
  end

  task dump_activities_to_csv: :environment do
    
    CSV.open('./activities.csv', 'wb') do |csv|
      Activity.all.each do |activity|
        activity_attrs = [
                          activity.park.name,
                          activity.activity      
                          ]
        csv << activity_attrs
      end
    end
  end
end