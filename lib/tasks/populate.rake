namespace :populate do 
  require 'populator'
  require 'faker'

  desc 'Seed Cars'
  task cars: :environment do 
    cars = {
      chevrolet: ['Silverado', 'Malibu', 'Camaro'],
      Ford: ['Focus', 'F-150', 'Fusion', 'Mustang'],
      kia: ['Optoma', 'Sophia'],
      honda: ['S2000', 'Civic', 'CRV'],
      toyota: ['Tacoma', 'rav-4', 'Supra']
    }
     

    Car.populate 200 do |car|
      make = cars.keys.sample
      model = cars[make].sample
      year = Faker::Date.between(20.years.ago, Date.today).year

      car.make = make.to_s.capitalize
      car.model = model
      car.year = year
    end
  end
end