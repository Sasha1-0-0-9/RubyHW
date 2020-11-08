class Unicorn

	def initialize name
		@name = name
		@asleep = 0
		@happiness = 100
		@satiety = 100
		@cleanliness = 100
		@health = 100

		puts @name + ' was born!'
	end

	def feed
		puts "You feed #{@name}"
		timeChanging()
		@satiety = 100
		@cleanliness -= 20
	end

	def walk
		puts "You walked with #{@name}"
		@happiness += 40
		@asleep -= 20
		@cleanliness -= 30
		timeChanging()
	end

	def takeAShower
		puts "#{@name} goes to have a shower"
		@cleanliness = 100
		timeChanging()
	end
	def goToSleep
		@asleep = rand(0..30)
		puts "#{@name} sleeping sweety"
		puts "Zzz"
		timeChanging()
	end

	def heal
		puts "#{@name} took a pill"
		@health += rand(30..50)
		if @health >= 100
			puts "#{@name} died of drug overdose =(" #drug в смысле лакарства=)
			puts "Press F to pay respect"
			gets.chomp
			exit
		end
	end

	def timeChanging
		@satiety -= 10
		@happiness -= 10
		@asleep -= -10
		if @satiety <= 0
			p "#{@name} is dead"
			exit
		elsif @satiety < 50 and @satiety > 0
			p "#{@name} is hungry"			
		end


		if @happiness < 50
			p "#{@name} is sad"
		end
		if @happiness > 100
			@happiness = 100
			end		
		if  @happiness <= 0
			puts "#{@name} run away"
			exit
		end

#________________________________________________________________________
		if @asleep > 60
			p "#{@name} want to sleep"
		end
		if @asleep < 0
			@asleep = 0
		end
		if @asleep >= 100
				p "#{@name} died of lack of sleep"
				puts "Press F to pay respect"
				gets.chomp
				exit
		end
#_______________________________________________________________________
		if @cleanliness < 0
			@cleanliness = 0
			puts "Unicorn #{@name} flew away to take a shower"
			exit
		end
		if @cleanliness < 50
			print "#{@name} smells bad"
		end
#_________________________________________________________________________		
		if @health > 100
			@health = 100
		end
		if @health < 50
			puts "#{@name} feeling bad"
		end
		if @health <= 0
			@health = 0
			print "#{@name} if dead"
			print "Press F to pay respect"
			gets.chomp
			exit
		end
	end

	def show_stats
		puts "#{@name}'s happiness: #{@happiness}"
		puts "#{@name}'s satiety: #{@satiety}"
		puts "#{@name}'s sleepy: #{@asleep}"
		puts "#{@name}'s cleanliness: #{@cleanliness}"
		puts "#{@name}'s health: #{@health}"
	end
end

name = gets.chomp
pet = Unicorn.new "#{name}"
pet.show_stats()
puts "______________________________________INSTRUCTION________________________________________________"
puts "Press 1 to sleep"
puts "Press 2 to feed your pet"
puts "Press 3 to walk with your pet"
puts "Press 4 to take a shower"
puts "Press 9 to skip 1 day"
x = gets.chomp.to_i
while x !=0
	case x
		when 1
			pet.goToSleep()
			pet.show_stats()
			x = gets.chomp.to_i
		when 2
			pet.feed()
			pet.show_stats()
			x = gets.chomp.to_i
		when 3
			pet.walk()
			pet.show_stats()
			x = gets.chomp.to_i
		when 4
			pet.takeAShower()
			pet.show_stats()
			x = gets.chomp.to_i
		when 5
			pet.heal()
			pet.show_stats()
			x = gets.chomp.to_i
				
		when 9
			pet.timeChanging()
			pet.show_stats()
			x = gets.chomp.to_i	
				
		else
			p "ERROR"
			x = gets.chomp.to_i
	end 
end