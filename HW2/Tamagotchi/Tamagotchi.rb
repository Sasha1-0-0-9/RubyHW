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
		after_period_of_time(@asleep, @happiness, 0 , @cleanliness, @health, @energy)
		@satiety = 100
		@cleanliness -= rand(10..30)
		@happiness += rand(5..30)
		@energy += rand(5..10)
		checking()
	end

	def walk
		puts "You walked with #{@name}"
		after_period_of_time(@asleep, 0, @satiety, @cleanliness, @health, @energy)
		@happiness += rand(20..40)
		@asleep -= rand(5..15)
		@cleanliness -= rand(10..30)
		@energy -= rand(20..50)
		checking()
	end

	def take_a_shower
		puts "#{@name} goes to have a shower"
		after_period_of_time(@asleep, @happiness, @satiety, 0, @health, @energy)
		@cleanliness = 100
		@energy -= 5
		checking()
	end
	def go_to_sleep
		after_period_of_time(0, @happiness,@satiety, @cleanliness, @health, @energy)
		@asleep = rand(0..30)
		@happiness += rand(5..30)
		@energy += rand(10..30)
		puts "#{@name} sleeping sweety"
		puts "Zzz"
		checking()
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

	def drink_an_energy_drink
		puts "#{@name} drinked energy drink"
		after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, 0)
		@energy += 30
		@health -= 15
		@asleep -= 5
		checking()
	end

	def play_boardgames
		puts "You playing board games with #{@name}"
		after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
		@happiness += rand(10..30)
		@asleep -= rand(5..10)
		@energy -= rand(0..10)
		checking()
	end

	def spectate
		if rand(0..1).zero?
			puts "You saw how your pet eats junk food"
			random_action1_eat_junk_food()
		else
			puts "You saw how your pet do sports"
			random_action2_do_sports()
		end
	end


	def random_action1_eat_junk_food
		after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
		@satiety += rand(5..10)
		@health -= rand(5..15)
		@cleanliness -= 5
		checking()
	end
	def random_action2_do_sports
		after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
		@satiety -= rand(5..10)
		@health += rand(5..14)
		@cleanliness -= 10
		@energy -= rand(5..10)
		checking()
		
	end

	def checking
		if @satiety <= 0
			puts "#{@name} died of hunger"
			duck_when_lost("Goodbye, my bro =(")
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
			puts "#{@name} flew away to have fun"
			exit
		end

		if @asleep > 60
			p "#{@name} want to sleep"
			duck("I want to sleep...Zzz")
			@health -= rand(1..15)
		end

		if @asleep < 0
			@asleep = 0
		end

		if @asleep >= 100
				puts "#{@name} died of lack of sleep"
				duck_when_lost("I just wanted to sleep...")
				puts "Press F to pay respect"
				gets.chomp
				exit
		end

		if @cleanliness < 0
			@cleanliness = 0
			puts "#{@name} flew away to take a shower"
			exit
		end
		if @cleanliness < 50
			puts "#{@name} smells bad"
			duck("OMG, I smell really bad")
		end

		if @health > 100
			@health = 100
		end

		if @health < 50
			puts "#{@name} feeling bad"
			duck("I got sick. I need a pill")
		end

		if @health <= 0
			@health = 0
			puts "#{@name} died of illness"
			duck_when_lost("Goodbye, my bro =(")
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
			puts "#{@name} died of lack of energy"
			puts "Press F to pay respect"
			gets.chomp
			exit
		end

	end

	private def after_period_of_time(asleep, happiness, satiety, cleanliness, health, energy)
		puts "A few moments later..."
		sleep 3
		@asleep += rand(5..20)
		@happiness -= rand(10..20)
		@satiety -= rand(10..40)
		@cleanliness -= rand(1..10) 
		@health -= rand(1..5)
		@energy -= rand(1..10)		
	end

	def skip_day #чтобы вызывать private метод за пределами класса
		after_period_of_time(@asleep, @happiness ,@satiety, @cleanliness, @health, @energy)
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
		Press 8 to watch what's your pet doing without you
		Press 9 to skip 1 day
		Use 'help' to get menu with instruction\x1b[0m"
end

puts "Enter your pet's name"
name = gets.chomp
pet = Duck.new "#{name}"
pet.show_stats()
x = gets.chomp.to_s
while x != "0"
	case x
		when "1"
			pet.go_to_sleep()
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
			pet.take_a_shower()
			pet.show_stats()
			x = gets.chomp.to_s
		when "5"
			pet.heal()
			pet.show_stats()
			x = gets.chomp.to_s
		when "6"
			pet.drink_an_energy_drink()
			pet.show_stats()
			x = gets.chomp.to_s
		when "7"
			pet.play_boardgames()
			pet.show_stats()
			x = gets.chomp.to_s
		when "8"
			pet.spectate()
			pet.show_stats()
			x = gets.chomp.to_s
		when "9"
			pet.skip_day
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
