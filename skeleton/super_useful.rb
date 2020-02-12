class LovesCoffee < StandardError 
 
end

class NotABestie < StandardError

end

class EmptyString < StandardError 

end

# PHASE 2
def convert_to_int(str)
  answer = nil
  begin
    answer = Integer(str)
  rescue ArgumentError => e
    puts e.message
    answer = 0
  ensure
    return answer
  end
  
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee' 
    raise LovesCoffee.new("Not a fruit, but I love coffee! Try again..")
  else
    raise StandardError.new("Not a fruit nor coffee...")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue LovesCoffee => e
    puts e.message
    retry
  rescue StandardError => error
    raise error.message
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)

    if name.empty? || fav_pastime.empty? 
      raise EmptyString.new("Cannot leave fields empty...")
    end
    if yrs_known < 5 
      raise NotABestie.new("Less than 5 years friendship who do you think you are")
    else
      @yrs_known = yrs_known
    end
    
    @name = name
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


