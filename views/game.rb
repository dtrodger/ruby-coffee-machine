require_relative '../controller'

include BaristaMaticReqs

module Game
	def self.start
		barista_matic = BaristaMaticReqs.get_barista_matic

		drink_codes = [*1..barista_matic.drink_options.length]
		
		loop do
			puts barista_matic.display_inventory_menu()
			input = gets.chomp.downcase

			break if input == "q"

			if input == "r"
				barista_matic.restock_ingredients
			elsif drink_codes.include? input.to_i
				input_int = input.to_i
				drink_choice = barista_matic.drink_options[input_int -1]

				barista_matic.take_order(drink_choice)
			else
				puts "Invalid selection: " + input
			end
		end
	end
end
