require 'celluloid'

class Rocket

  include Celluloid

  def launch
    3.downto(1) do |n|
      puts "#{n}..."
      sleep 1
    end
    puts "Blast off!"
  end
end
