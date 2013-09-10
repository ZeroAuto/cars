class Car
	@@total_car_count = 0
	@@cars_per_color = {}
	@@miles_driven={}
	attr_reader :color

	def self.total_car_count
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color, name=nil)
		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		@name = name
		if @@cars_per_color[color]==nil
			@@cars_per_color[color]=1
		else
			@@cars_per_color[color]+=1
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
		@@miles_driven[@name] = @distance
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

	def change_color(new_color, color)
		@@cars_per_color[color] -= 1
		if @@cars_per_color[new_color]==nil
			@@cars_per_color[new_color]=1
		else
			@@cars_per_color[new_color]+=1
		end
	end

	def self.most_popular_color
		@@cars_per_color.each { |k, v| return k if v == @@cars_per_color.values.max }
	end

	def self.most_miles_driven
		@@miles_driven.each { |k, v| return k if v == @@miles_driven.values.max}
	end

end

class Convertible < Car
	def initialize(color, name=nil, roof_status=nil)
		super(color, name)
		@roof_status=roof_status
	end

	def top_down
		if @roof_status == "down"
			puts "The roof is already down."
		else
			puts "The roof is down."
			return @roof_status == "down"
		end
	end

	def close_top
		if @roof_status == "closed"
			puts "The roof is already closed."
		else
			puts "The roof is closed."
			return @roof_status == "closed"
		end
	end

end


c1=Car.new("blue", "c1")
c2=Car.new("green", "c2")
c3=Car.new("green", "c3")
c4=Car.new("black", "c4")
c5=Car.new("black", "c5")
c6=Car.new("black", "c6")
c7=Car.new("black", "c7")
c8=Car.new("black", "c8")
c8.change_color("yellow", "black")

best_color = Car.most_popular_color
Car.new(best_color)

crew = Car.new(best_color)
puts "#{best_color}"

c1.drive(10)
c2.drive(17)
c3.drive(12)
c4.drive(18)
c5.drive(15)
c6.drive(14)
c7.drive(12)
c8.drive(11)

c9=Convertible.new("red", "c9", "closed")
c10=Convertible.new("blue", "c10", "down")
# c9=ConvertibleCar.new("close")
# c10=ConvertibleCar.new("down")

c9.top_down
c9.close_top
c10.top_down
c10.close_top
c9.drive(300)

furthest_car = Car.most_miles_driven
puts "#{furthest_car}"


# puts Car.total_car_count
# puts Car.total_car_count
# puts Car.total_car_count
# puts Car.total_car_count
# c1 = Car.new
# puts Car.total_car_count
# c2 = Car.new
# puts Car.total_car_count

# car_a = Car.new()
# car_b = Car.new()
# puts car_a
# puts car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
# car_b.drive(117)
# puts car_a
# puts car_b