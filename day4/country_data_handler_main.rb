module CountryData
  class Country
    attr_accessor :name, :population, :gdp, :states, :army_strength, :development_status

    def initialize(name, population, gdp, states, army_strength, development_status)
      @name = name
      @population = population
      @gdp = gdp
      @states = states
      @army_strength = army_strength
      @development_status = development_status
    end

    def display_details
      puts "\nDetails for #{@name}:"
      puts "Population: #{@population}"
      puts "GDP: #{@gdp}"
      puts "States: #{@states.join(', ')}"
      puts "Army Strength: #{@army_strength}"
      puts "Development Status: #{@development_status.capitalize}"
    end

    def eligible_for_imf_loan?
      @gdp < 1e12 && @development_status == "developing"
    end

    def eligible_for_unsc_seat?
      @gdp > 1e12 && @army_strength > 1000000
    end

    def strong_in_war?
      @army_strength > 500000
    end
  end

  class CountryManager
    def initialize
     
      @countries = {
        "india" => Country.new("india", 1400000000, 3.7e12, ["Maharashtra", "Karnataka", "Tamil Nadu"], 1400000, "developing"),
        "usa" => Country.new("usa", 330000000, 23e12, ["California", "Texas", "New York"], 1500000, "developed"),
        "china" => Country.new("china", 1440000000, 18.3e12, ["Guangdong", "Beijing", "Shanghai"], 2000000, "developing"),
        "japan" => Country.new("japan", 125000000, 5e12, ["Tokyo", "Osaka", "Kyoto"], 240000, "developed")
      }
    end

    def handle_query
      print "\nEnter the country name: "
      name = gets.chomp

      country = @countries[name]
      if country == nil
        puts "Country not found. Please try again."
        return
      end

      puts "\nAvailable Questions:"
      puts "1. View country details"
      puts "2. Is the country eligible for an IMF loan?"
      puts "3. Can the country get a UN Security Council seat?"
      puts "4. Is the country strong enough to win a war?"
      print "Enter your choice (1-4): "
      choice = gets.chomp

      case choice
      when "1"
        country.display_details
      when "2"
        if country.eligible_for_imf_loan?
          puts "#{name} qualifies for an IMF/World Bank loan."
        else
          puts "#{name} does not qualify for an IMF/World Bank loan."
        end
      when "3"
        if country.eligible_for_unsc_seat?
          puts "#{name} qualifies for a UN Security Council seat."
        else
          puts "#{name} does not qualify for a UN Security Council seat."
        end
      when "4"
        if country.strong_in_war?
          puts "#{name} is likely to win a war."
        else
          puts "#{name} may not win a war."
        end
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end

class Main
  def initialize
    @manager = CountryData::CountryManager.new
  end

  def run
    loop do
      puts "\nCountry Data Handler"
      puts "1. Query Country Data"
      puts "2. Exit"
      print "Enter your choice: "
      choice = gets.chomp

      case choice
      when "1"
        @manager.handle_query
      when "2"
        puts "Exiting... "
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end

# Start the application
Main.new.run

