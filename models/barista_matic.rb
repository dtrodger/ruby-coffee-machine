class BaristaMatic

	attr_accessor :stocked_ingredients, :drink_options

	def initialize(args = {})
		@stocked_ingredients = args.fetch(:stocked_ingredients) {[]}
		@drink_options = args.fetch(:drink_options) {[]}
	end

	def display_inventory_menu
		intenvotry_and_menu = "Inventory:\n"

		self.stocked_ingredients.each do |stocked_ingredient|
			intenvotry_and_menu += " " + stocked_ingredient[1].type + "," + stocked_ingredient[0].to_s + "\n"
		end

		output_string += "Menu:\n"

		self.drink_options.each_with_index do |drink_option, i|
			intenvotry_and_menu += " " + (i + 1).to_s + "," + drink_option.name + ",$" + drink_option.price + ",\n"
		end

		intenvotry_and_menu
	end

	def restock_ingredients
		self.stocked_ingredients.each do |stocked_ingredient|
			stocked_ingredient[0] = 10
		end
	end

	def take_order(drink)
		if drink_available?(drink)
			self.dispense_drink(drink)
		else
			puts "Out of stock: " + drink.name

			self.display_inventory_menu
		end
	end

	def drink_available?(drink)
		drink.req_ingredients.each do |ingredient|
			if !ingredients_available?(ingredient[1], ingredient[0])
				return false
			end
		end

		true
	end

	def find_ingredient(ingredient)
		self.stocked_ingredients.each do |stocked_ingredient|
			if stocked_ingredient[1] == ingredient
				return stocked_ingredient
			end
		end
	end

	def ingredients_available?(ingredient, quantity)
		stocked_ingredient = find_ingredient(ingredient)

		if stocked_ingredient[0] < quantity
			return false
		end
	
		true
	end

	def reduce_ingredient_stock(ingredient, quantity)
		stocked_ingredient = find_ingredient(ingredient)
		stocked_ingredient[0] = stocked_ingredient[0] - quantity
	end

	def dispense_drink(drink)
		drink.req_ingredients.each do |ingredient|
			reduce_ingredient_stock(ingredient[1], ingredient[0])
		end

		puts "Dispensing: " + drink.name

		self.display_inventory_menu
	end
end
