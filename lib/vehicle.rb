class Vehicle
  @@vehicles = []
  define_method(:initialize) do |attributes|
    @make = attributes.fetch(:make)
    @model = attributes.fetch(:model)
    @year = attributes.fetch(:year)
    @color = attributes.fetch(:color)
    @engine_size= attributes.fetch(:engine_size)
    @number_of_doors = attributes.fetch(:number_of_doors)
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_method(:age) do
    current_year = Time.new().year()
    current_year.-(@year)
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler", "Ford", "GM"]
    american = american_cars.include?(@make)
    new_enough = age().<=(15)
    american.&(new_enough)
  end

  define_singleton_method(:find) do |identification|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end




end
