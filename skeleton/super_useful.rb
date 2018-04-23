# PHASE 2
def convert_to_int(str)
    begin
      Integer(str)
    rescue TypeError => e
      puts e.message
      return nil
    end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotAFruitError
  end
end

class NotAFruitError < StandardError
  def message
    "This is the end of your run. I will eat you now!"
  end

end

class CoffeeError < StandardError
  def message
    "Yum! I will let you try again."
  end
end



def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => ce
    puts ce.message
    retry
  rescue NotAFruitError => err
    puts err.message
  end
end

# PHASE 4
class NotABestFriendError < StandardError

end

class DescriptiveError < StandardError

end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    raise NotABestFriendError.new("You barely know this person!") if yrs_known < 5
    @fav_pastime = fav_pastime
    raise DescriptiveError.new("C'mon man!") if name.length == 0 || fav_pastime.length == 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
