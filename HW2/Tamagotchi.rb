require_relative 'UI'

class Duck < Ui

	def initialize name
		@name = name
		@asleep = 0
		@happiness = 100
		@satiety = 100
		@cleanliness = 100
		@health = 100
		@energy = 100
		banner()

		puts @name + ' was born!'
	end

	def feed
		puts "You feed #{@name}"
		after1hour(@asleep, @happiness,0, @cleanliness, @health)
		@satiety = 100
		@cleanliness -= rand(10..30)
		@happiness += rand(5..30)
		@energy += rand(5..10)
		timeChanging()
	end

	def walk
		puts "You walked with #{@name}"
		after1hour(@asleep, 0,@satiety, @cleanliness, @health)
		@happiness += rand(20..40)
		@asleep -= rand(5..15)
		@cleanliness -= rand(10..30)
		@energy -= rand(20..50)
		timeChanging()
	end

	def takeAShower
		puts "#{@name} goes to have a shower"
		after1hour(@asleep, @happiness,@satiety, 0, @health)
		@cleanliness = 100
		@energy -= 5
		timeChanging()
	end
	def goToSleep
		after1hour(0, @happiness,@satiety, @cleanliness, @health)
		@asleep = rand(0..30)
		@happiness += rand(5..30)
		@energy += rand(10..30)
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

	def drinkAnEnergyDrink
		after1hour(@asleep, @happiness ,@satiety, @cleanliness, @health)
		@energy += 30
		@health -= 15
		@asleep -= 5
		timeChanging()
	end

	def playBoardgames
		after1hour(@asleep, @happiness ,@satiety, @cleanliness, @health)
		@happiness += rand(10..30)
		@asleep -= rand(5..10)
		@energy -= rand(0..10)
		timeChanging()
	end

	def spectate
		if rand(0..1) == 0
			puts "You saw how your pet eats junk food"
			randomAction1_eatJunkFood()
		else
			puts "You saw how your pet do sports"
			randomAction2_doSports()
		end
	end


	def randomAction1_eatJunkFood
		after1hour(@asleep, @happiness ,@satiety, @cleanliness, @health)
		@satiety += rand(5..10)
		@health -= rand(5..15)
		@cleanliness -= 5
		timeChanging()
	end
	def  randomAction2_doSports
		after1hour(@asleep, @happiness ,@satiety, @cleanliness, @health)
		@satiety -= rand(5..10)
		@health += rand(5..14)
		@cleanliness -= 10
		@energy -= rand(5..10)
		timeChanging()
		
	end




	def timeChanging
		if @satiety <= 0
			puts "#{@name} died of hunger"
			duckWhenLost("Goodbye, my bro =(")
			exit
		elsif @satiety < 50 and @satiety > 0
			puts "#{@name} is hungry"
			duck("Bro, I'm hungry. Give me some food")			
		end


		if @happiness < 50
			puts"#{@name} is sad"
			duck("I'm sad. Play with me")
		end
		if @happiness > 100
			@happiness = 100
			end		
		if  @happiness <= 0
			puts "#{@name} run away to have fun"
			exit
		end

#==============================================================
		if @asleep > 60
			p "#{@name} want to sleep"
			duck("I want to sleep...Zzz")
			@health -= rand(1..15)
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
#==============================================================
		if @cleanliness < 0
			@cleanliness = 0
			puts "#{@name} duck flew away to take a shower"
			exit
		end
		if @cleanliness < 50
			puts "#{@name} smells bad"
			duck("OMG, I smell really bad")
		end
#==============================================================		
		if @health > 100
			@health = 100
		end
		if @health < 50
			puts "#{@name} feeling bad"
			duck("I got sick. I need a pill")
		end
		if @health <= 0
			@health = 0
			puts "#{@name} isw dead"
			duckWhenLost("Goodbye, my bro =(")
			puts "Press F to pay respect"
			gets.chomp
			exit
		end


		if @energy > 100
			@energy = 100
		end
		if @energy < 30 and @energy > 0
			puts "#{@name} is tired"
			duck("I am tired")
		end
		if @energy < 0
			@energy = 0
			puts "#{@name} if dead"
			puts "Press F to pay respect"
			gets.chomp
			exit
		end

	end
	def after1hour(asleep, happiness, satiety, cleanliness, health)
		puts "A few moments later..."
		sleep 3
		@asleep += rand(5..20)
		@happiness -= rand(10..20)
		@satiety -= rand(10..40)
		@cleanliness -= rand(1..10) 
		@health -= rand(1..5)		
	end

	def show_stats

		puts "_______________________________
    |#{@name}'s happiness: #{@happiness}      
    |#{@name}'s satiety: #{@satiety}        
    |#{@name}'s sleepiness: #{@asleep}       
    |#{@name}'s cleanliness: #{@cleanliness}
    |#{@name}'s health: #{@health}
    |#{@name}'s energy: #{@energy} 
	"
	end

end

def help
		puts "			\x1b[1;32mINSTRUCTION
		Press 0 to exit
		Press 1 to sleep
		Press 2 to feed your pet
		Press 3 to walk with your pet
		Press 4 to take a shower
		Press 5 to heal your pet
		Press 6 to drink an energy drink
		Press 7 to play board games with your pet
		Press 8 to watch your pet
		Press 9 to skip 1 day
		Use 'help' to get menu with instruction\x1b[0m"
end

puts "Enter your pet's name"
name = gets.chomp
pet = Duck.new "#{name}"
pet.show_stats()
x = gets.chomp.to_s
while x !="0"
	case x
		when "1"
			pet.goToSleep()
			pet.show_stats()
			x = gets.chomp.to_s
		when "2"
			pet.feed()
			pet.show_stats()
			x = gets.chomp.to_s
		when "3"
			pet.walk()
			pet.show_stats()
			x = gets.chomp.to_s
		when "4"
			pet.takeAShower()
			pet.show_stats()
			x = gets.chomp.to_s
		when "5"
			pet.heal()
			pet.show_stats()
			x = gets.chomp.to_s
		when "6"
			pet.drinkAnEnergyDrink()
			pet.show_stats()
			x = gets.chomp.to_s
		when "7"
			pet.playBoardgames()
			pet.show_stats()
			x = gets.chomp.to_s
		when "8"
			pet.spectate()
			pet.show_stats()
			x = gets.chomp.to_s
		when "9"
			pet.after1hour(@asleep, @happiness, @satiety, @cleanliness, @health)
			pet.show_stats()
			x = gets.chomp.to_s
		when  "help"
			help()
			x = gets.chomp.to_s
		else
			p "ERROR"
			x = gets.chomp.to_s
	end 
end
